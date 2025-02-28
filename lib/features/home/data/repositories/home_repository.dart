import 'package:climax/core/error/exceptions.dart';
import 'package:climax/core/error/failure.dart';
import 'package:climax/core/logger/logs.dart';
import 'package:climax/core/typedef/typedef.dart';
import 'package:climax/features/home/data/datasources/home_local_data_source.dart';
import 'package:climax/features/home/data/datasources/home_remote_data_source.dart';
import 'package:climax/features/home/data/models/weather_model.dart';
import 'package:dartz/dartz.dart';

class HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepository(this.homeRemoteDataSource, this.homeLocalDataSource);

  DefaultResponse<WeatherModel> getCurrentWeather(
      double lat, double lon) async {
    try {
      final response = await homeRemoteDataSource.getCurrentWeather(lat, lon);
      if (response.statusCode == 200) {
        kLogger.green("Get Current Weather Success ");

        final weather = WeatherModel.fromMap(response.data);

        //* Cache the weather data
        await homeLocalDataSource.cacheCurrentWeather(weather);

        return Right(weather);
      }
      kLogger.red('Error in Get Current Weather Data ${response.data}');
      return Left(ServerFailure(
        message: response.data['message'],
        code: response.data['code'],
      ));
    } on NoInternetConnectionException catch (e) {
      kLogger.red("No Internet - Returning Cached Weather Data $e ");
      final cachedWeather = homeLocalDataSource.getCachedCurrentWeather();
      if (cachedWeather != null) {
        return Right(cachedWeather);
      }
      return const Left(
          ServerFailure(message: "No internet and no cached data."));
    } catch (e) {
      kLogger.red("Error in Get Current Weather: $e");
      return Left(ServerFailure(message: e.toString()));
    }
  }

  DefaultResponse<List<WeatherModel>> getNextFiveDaysWeather(
      double lat, double lon) async {
    try {
      final response =
          await homeRemoteDataSource.getNextFiveDaysWeather(lat, lon);
      if (response.statusCode == 200) {
        kLogger.green("Get The Next Five Days Weather Success ");
        final List<dynamic> forecasts = response.data["list"];

        // Map for unique days
        Map<String, WeatherModel> dailyWeather = {};

        for (var forecast in forecasts) {
          WeatherModel weather = WeatherModel.fromMap(forecast);
          dailyWeather[weather.dtTxt!] ??=
              weather; // Pick first occurrence per day
          if (dailyWeather.length == 5) break;
        }

        final weatherList = dailyWeather.values.toList();

        //* Cache data
        await homeLocalDataSource.cacheNextFiveDaysWeather(weatherList);

        return Right(weatherList);
      }
      kLogger
          .red('Error in Get The Next Five Days Weather Data ${response.data}');
      return Left(ServerFailure(
        message: response.data['message'],
        code: response.data['code'],
      ));
    } on NoInternetConnectionException catch (e) {
      kLogger.red("No Internet - Returning Cached 5-Day Forecast $e");
      final cachedWeather = homeLocalDataSource.getCachedNextFiveDaysWeather();
      if (cachedWeather != null) {
        return Right(cachedWeather);
      }
      return const Left(
          ServerFailure(message: "No internet and no cached data."));
    } catch (e) {
      kLogger.red("Error in Get Next Five Days Weather: $e");
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
