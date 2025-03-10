import 'package:equatable/equatable.dart';

import '../../../../core/enums/request_state.dart';
import '../../data/models/weather_model.dart';

class HomeState extends Equatable {
  const HomeState({
    this.getCurrentWeatherStatus = RequestStatus.initial,
    this.getTheNextFiveDaysWeatherStatus = RequestStatus.initial,
    this.currentWeather,
    this.getCurrentWeatherErrorMessage,
    this.getTheNextFiveDaysWeatherErrorMessage,
    this.nextFiveDaysWeather = const [],
    this.currentSelectedDayIndex = 0,
  });

  //* Grouping Current Weather States
  final RequestStatus getCurrentWeatherStatus;
  final String? getCurrentWeatherErrorMessage;
  final WeatherModel? currentWeather;

  //* Grouping Next Forecast States
  final RequestStatus getTheNextFiveDaysWeatherStatus;
  final String? getTheNextFiveDaysWeatherErrorMessage;
  final List<WeatherModel?> nextFiveDaysWeather;

  //* Weather Details
  final int currentSelectedDayIndex;

  @override
  List<Object?> get props {
    return [
      getCurrentWeatherStatus,
      getCurrentWeatherErrorMessage,
      currentWeather,
      getTheNextFiveDaysWeatherStatus,
      getTheNextFiveDaysWeatherErrorMessage,
      nextFiveDaysWeather,
      currentSelectedDayIndex,
    ];
  }

  HomeState copyWith({
    RequestStatus? getCurrentWeatherStatus,
    String? getCurrentWeatherErrorMessage,
    WeatherModel? currentWeather,
    RequestStatus? getTheNextFiveDaysWeatherStatus,
    String? getTheNextFiveDaysWeatherErrorMessage,
    List<WeatherModel?>? nextFiveDaysWeather,
    int? currentSelectedDayIndex,
  }) {
    return HomeState(
      getCurrentWeatherStatus:
          getCurrentWeatherStatus ?? this.getCurrentWeatherStatus,
      getCurrentWeatherErrorMessage:
          getCurrentWeatherErrorMessage ?? this.getCurrentWeatherErrorMessage,
      currentWeather: currentWeather ?? this.currentWeather,
      getTheNextFiveDaysWeatherStatus: getTheNextFiveDaysWeatherStatus ??
          this.getTheNextFiveDaysWeatherStatus,
      getTheNextFiveDaysWeatherErrorMessage:
          getTheNextFiveDaysWeatherErrorMessage ??
              this.getTheNextFiveDaysWeatherErrorMessage,
      nextFiveDaysWeather: nextFiveDaysWeather ?? this.nextFiveDaysWeather,
      currentSelectedDayIndex:
          currentSelectedDayIndex ?? this.currentSelectedDayIndex,
    );
  }
}
