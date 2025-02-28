import 'package:climax/core/utils/constant.dart';

class EndPoint {
  static final String baseUrl = kDotEnv.get("BASE_URL");

  static const String currentWeather = '/weather';
  static const String forecastForFiveDays = '/forecast';
  static const String search = '/auth/forgot-password';
}
