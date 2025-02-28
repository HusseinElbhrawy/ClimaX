import 'package:climax/core/api/api_consumer.dart';
import 'package:climax/core/api/end_point.dart';
import 'package:climax/features/home/data/datasources/home_remote_data_source.dart';
import 'package:climax/features/home/data/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_remote_data_source_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<ApiConsumer>(),
    MockSpec<WeatherModel>(),
  ],
)
void main() {
  late HomeRemoteDataSource homeRemoteDataSource;
  late ApiConsumer apiConsumer;

  //! To Setup all the dependencies
  setUp(() {
    apiConsumer = MockApiConsumer();
    homeRemoteDataSource = HomeRemoteDataSource(apiConsumer);
  });

  test(
    'Test Get Current Weather Data Without any errors',
    () async {
      //Arrange
      double lat = 30.78833360;
      double lon = 30.99850190;

      when(
        apiConsumer.post(
          EndPoint.currentWeather,
          query: {"lat": lat, "lon": lon},
        ),
      ).thenAnswer(
        (_) async {
          return Response(
            statusCode: 200,
            requestOptions: RequestOptions(
              path: EndPoint.currentWeather,
              queryParameters: {"lat": lat, "lon": lon},
              data: MockWeatherModel(),
            ),
          );
        },
      );

      //Act
      final result = await homeRemoteDataSource.getCurrentWeather(lat, lon);
      //Assert
      expect(result, isA<Response>());
    },
  );
}
