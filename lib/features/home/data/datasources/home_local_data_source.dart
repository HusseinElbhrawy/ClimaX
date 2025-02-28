import 'dart:convert';

import 'package:climax/features/home/data/models/weather_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeLocalDataSource {
  static const String currentWeatherKey = "current_weather";
  static const String nextFiveDaysWeatherKey = "next_five_days_weather";

  final SharedPreferences sharedPreferences;

  HomeLocalDataSource(this.sharedPreferences);

  Future<void> cacheCurrentWeather(WeatherModel weather) async {
    final weatherJson = json.encode(weather.toMap());
    await sharedPreferences.setString(currentWeatherKey, weatherJson);
  }

  WeatherModel? getCachedCurrentWeather() {
    final weatherJson = sharedPreferences.getString(currentWeatherKey);
    if (weatherJson != null) {
      return WeatherModel.fromMap(json.decode(weatherJson));
    }
    return null;
  }

  Future<void> cacheNextFiveDaysWeather(List<WeatherModel> weatherList) async {
    final weatherJson = json.encode(weatherList.map((e) => e.toMap()).toList());
    await sharedPreferences.setString(nextFiveDaysWeatherKey, weatherJson);
  }

  List<WeatherModel>? getCachedNextFiveDaysWeather() {
    final weatherJson = sharedPreferences.getString(nextFiveDaysWeatherKey);
    if (weatherJson != null) {
      final List<dynamic> data = json.decode(weatherJson);
      return data.map((e) => WeatherModel.fromMap(e)).toList();
    }
    return null;
  }
}
