import 'package:climax/core/api/end_point.dart';
import 'package:climax/core/error/exceptions.dart';
import 'package:climax/core/error/failure.dart';
import 'package:climax/features/home/data/datasources/home_remote_data_source.dart';
import 'package:climax/features/home/data/models/weather_model.dart';
import 'package:climax/features/home/data/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<HomeRemoteDataSource>(),
  MockSpec<WeatherModel>(),
])
void main() {
  late HomeRepository homeRepository;
  late MockHomeRemoteDataSource mockHomeRemoteDataSource;
  late WeatherModel mockWeatherModel;

  setUp(() {
    mockHomeRemoteDataSource = MockHomeRemoteDataSource();
    mockWeatherModel = MockWeatherModel();
    homeRepository = HomeRepository(mockHomeRemoteDataSource);
  });

  test(
    'Should return WeatherModel when API call is successful',
    () async {
      // Arrange
      double lat = 30.78833360;
      double lon = 30.99850190;

      when(mockWeatherModel.toMap()).thenReturn({
        'weather': [
          {'main': 'Cloudy', 'description': 'Partly cloudy'}
        ],
        'main': {
          'temp': 25.5,
          'feels_like': 26.0,
          'temp_min': 24.0,
          'temp_max': 27.0,
          'pressure': 1013,
          'humidity': 80,
          'sea_level': 1013,
          'grnd_level': 1000,
        },
        'wind': {'speed': 5.5},
        'timezone': 7200,
        'name': 'Test City',
      });

      final weatherModel = WeatherModel.fromMap(mockWeatherModel.toMap());

      final response = Response(
        data: weatherModel.toMap(),
        statusCode: 200,
        requestOptions: RequestOptions(path: EndPoint.currentWeather),
      );

      when(mockHomeRemoteDataSource.getCurrentWeather(lat, lon))
          .thenAnswer((_) async => response);

      // Act
      final result = await homeRepository.getCurrentWeather(lat, lon);

      // Assert
      expect(result, Right(weatherModel));
      // expect(result, isA<Right>());
    },
  );

  test(
    'Should return ServerFailure when API returns an error',
    () async {
      // Arrange
      double lat = 30.78833360;
      double lon = 30.99850190;

      final response = Response(
        data: {"message": "Internal Server Error", "code": 500},
        statusCode: 500,
        requestOptions: RequestOptions(path: EndPoint.currentWeather),
      );

      when(mockHomeRemoteDataSource.getCurrentWeather(lat, lon))
          .thenAnswer((_) async => response);

      // Act
      final result = await homeRepository.getCurrentWeather(lat, lon);

      // Assert
      expect(
          result,
          const Left(
              ServerFailure(message: "Internal Server Error", code: 500)));
    },
  );

  test(
    'Should return ServerFailure when NoInternetConnectionException is thrown',
    () async {
      // Arrange
      double lat = 30.78833360;
      double lon = 30.99850190;
      const message = "No Internet Connection";

      when(mockHomeRemoteDataSource.getCurrentWeather(lat, lon))
          .thenThrow(const NoInternetConnectionException(message));

      // Act
      final result = await homeRepository.getCurrentWeather(lat, lon);

      // Assert
      expect(result, const Left(ServerFailure(message: message)));
    },
  );
}
