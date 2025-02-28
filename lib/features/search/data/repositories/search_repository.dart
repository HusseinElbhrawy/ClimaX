import 'package:climax/core/logger/logs.dart';
import 'package:climax/core/typedef/typedef.dart';
import 'package:climax/features/home/data/models/weather_model.dart';
import 'package:climax/features/search/data/datasources/search_remote_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';

class SearchRepository {
  final SearchRemoteDataSource _searchRemoteDataSource;

  SearchRepository(this._searchRemoteDataSource);

  DefaultResponse<WeatherModel> searchWithCityName(String city) async {
    try {
      final response = await _searchRemoteDataSource.searchWithCityName(city);
      if (response.statusCode == 200) {
        kLogger.green("Search With City Name Weather Success ");
        return Right(WeatherModel.fromMap(response.data));
      }
      kLogger.red('Error in Get Search With City Name Data ${response.data}');
      return Left(
        ServerFailure(
          message: response.data['message'],
          code: response.data['code'],
        ),
      );
    } on NoInternetConnectionException catch (e) {
      kLogger.red(
        "Search With City Name Failed Status in NoInternetConnectionException Block $e",
      );
      return Left(ServerFailure(message: e.message.toString()));
    } catch (e) {
      kLogger.red("Search With City Name Failed Status in Catch Block $e");
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
