import 'package:climax/core/api/api_consumer.dart';
import 'package:climax/core/api/end_point.dart';
import 'package:dio/dio.dart';

class SearchRemoteDataSource {
  final ApiConsumer _apiConsumer;

  SearchRemoteDataSource(this._apiConsumer);

  Future<Response> searchWithCityName(String city) async {
    final response = await _apiConsumer.post(
      EndPoint.currentWeather,
      query: {"q": city},
    );

    return response;
  }
}
