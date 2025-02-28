import 'package:climax/core/enums/request_state.dart';
import 'package:climax/core/logger/logs.dart';
import 'package:climax/core/utils/app_assets.dart';
import 'package:climax/features/home/data/repositories/home_repository.dart';
import 'package:climax/features/home/logic/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(const HomeState());

  final HomeRepository _homeRepository;

  ///* Get Current Location
  Future<Position?> _getCurrentLocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      return _handleLocationFetchingErrors('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return _handleLocationFetchingErrors('Location permissions are denied.');
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.best),
    );

    kLogger.green(
        'Location fetched: [Lat: ${position.latitude}, Lng: ${position.longitude}]');
    return position;
  }

  Position? _handleLocationFetchingErrors(String errorMessage) {
    kLogger.red(errorMessage);
    emit(
      state.copyWith(
        getCurrentWeatherStatus: RequestStatus.error,
        getCurrentWeatherErrorMessage: errorMessage,
      ),
    );
    return null;
  }

  ///* Fetch Current Weather
  Future<void> getCurrentWeather() async {
    emit(state.copyWith(getCurrentWeatherStatus: RequestStatus.loading));

    final position = await _getCurrentLocation();
    if (position == null) return;

    final result = await _homeRepository.getCurrentWeather(
      position.latitude,
      position.longitude,
    );
    result.fold(
      (failure) => _emitWeatherError(failure.message),
      (weather) => emit(
        state.copyWith(
          getCurrentWeatherStatus: RequestStatus.success,
          currentWeather: weather,
        ),
      ),
    );
  }

  ///* Fetch Next Five Days Weather
  Future<void> getNextFiveDaysWeather() async {
    emit(
        state.copyWith(getTheNextFiveDaysWeatherStatus: RequestStatus.loading));

    final position = await _getCurrentLocation();
    if (position == null) return;

    final result = await _homeRepository.getNextFiveDaysWeather(
        position.latitude, position.longitude);
    result.fold(
      (failure) => _emitWeatherError(failure.message),
      (weather) {
        kLogger.cyan('Next 5 Days Weather fetched: ${weather.length} entries');
        emit(state.copyWith(
          getTheNextFiveDaysWeatherStatus: RequestStatus.success,
          nextFiveDaysWeather: weather,
        ));
      },
    );
  }

  void _emitWeatherError(String message) {
    kLogger.red('Weather Fetch Error: $message');
    emit(
      state.copyWith(
        getCurrentWeatherStatus: RequestStatus.error,
        getCurrentWeatherErrorMessage: message,
      ),
    );
  }

  ///* Get Current Date
  String get currentDate =>
      DateFormat('EEEE, d MMM yyyy').format(DateTime.now());

  ///* update current selected day index
  void updateCurrentSelectedDayIndex(int index) {
    emit(state.copyWith(currentSelectedDayIndex: index));
  }

  @override
  Future<void> close() {
    kLogger.red('Home Cubit Closed');
    return super.close();
  }

  Map<String, String> weatherStatusImages = {
    "clear": AppImageAssets.clear,
    "clouds": AppImageAssets.lightCloud,
    "scattered": AppImageAssets.heavyCloud,
    "shower": "",
    "rain": AppImageAssets.lightRain,
    "thunderstorm": AppImageAssets.thunderstorm,
    "snow": AppImageAssets.snow,
    "mist": AppImageAssets.heavyCloud,
    "default": AppImageAssets.clear,
  };

  String getWeatherImage(String apiStatus) {
    return weatherStatusImages.entries
        .firstWhere(
          (entry) => apiStatus.toLowerCase().contains(entry.key.toLowerCase()),
          orElse: () => const MapEntry("default", AppImageAssets.clear),
        )
        .value;
  }
}
