import 'package:climax/core/error/exceptions.dart';
import 'package:climax/core/error/failure.dart';
import 'package:climax/core/logger/logs.dart';
import 'package:climax/core/typedef/typedef.dart';
import 'package:climax/features/home/data/datasources/home_remote_data_source.dart';
import 'package:climax/features/home/data/models/weather_model.dart';
import 'package:dartz/dartz.dart';

class HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepository(this.homeRemoteDataSource);

  DefaultResponse<WeatherModel> getCurrentWeather(
      double lat, double lon) async {
    try {
      final response = await homeRemoteDataSource.getCurrentWeather(lat, lon);
      if (response.statusCode == 200) {
        kLogger.green("Get Current Weather Success ");
        //ToDo : Cache Tokens;
        return Right(WeatherModel.fromMap(response.data));
      }
      kLogger.red('Error in Get Current Weather Data ${response.data}');
      return Left(
        ServerFailure(
          message: response.data['message'],
          code: response.data['code'],
        ),
      );
    } on NoInternetConnectionException catch (e) {
      kLogger.red(
        "Register Failed Status in NoInternetConnectionException Block $e",
      );
      return Left(ServerFailure(message: e.message.toString()));
    } catch (e) {
      kLogger.red("Register Failed Status in Catch Block $e");
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

        // return dailyWeather.values.toList();
        return Right(dailyWeather.values.toList());
        //ToDo : Cache Tokens;
        // return Right(
        //   (response.data['list'] as List)
        //       .map((e) => WeatherModel.fromMap(e))
        //       .toList(),
        // );
      }
      kLogger
          .red('Error in Get The Next Five Days Weather Data ${response.data}');
      return Left(
        ServerFailure(
          message: response.data['message'],
          code: response.data['code'],
        ),
      );
    } on NoInternetConnectionException catch (e) {
      kLogger.red(
        "Register Failed Status in NoInternetConnectionException Block $e",
      );
      return Left(ServerFailure(message: e.message.toString()));
    } catch (e) {
      kLogger.red("Register Failed Status in Catch Block $e");
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
