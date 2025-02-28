import 'package:climax/core/utils/constant.dart';

class EndPoint {
  static final String baseUrl = kDotEnv.get("BASE_URL");
  static final String baseImageURL = kDotEnv.get("BASE_IMAGE_URL");

  static const String currentWeather = '/weather';
  static const String forecastForFiveDays = '/forecast';
}
