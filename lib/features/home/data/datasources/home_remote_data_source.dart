import 'package:climax/core/api/api_consumer.dart';
import 'package:climax/core/api/end_point.dart';
import 'package:dio/dio.dart';

class HomeRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeRemoteDataSource(this.apiConsumer);

  Future<Response> getCurrentWeather(double lat, double lon) async {
    final response = await apiConsumer.post(
      EndPoint.currentWeather,
      query: {"lat": lat, "lon": lon},
    );

    return response;
  }

  Future<Response> getNextFiveDaysWeather(double lat, double lon) async {
    final response = await apiConsumer.post(
      EndPoint.forecastForFiveDays,
      query: {"lat": lat, "lon": lon},
    );

    return response;
  }
}
