import 'package:climax/core/enums/request_state.dart';
import 'package:climax/core/logger/logs.dart';
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
    // Check if location services are enabled
    if (!await Geolocator.isLocationServiceEnabled()) {
      return _handleLocationFetchingErrors('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();

    // If denied, request permission and wait for response
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      // If still denied after requesting, return error
      if (permission == LocationPermission.denied) {
        return _handleLocationFetchingErrors(
            'Location permissions are denied.');
      }
    }

    // If permanently denied, return error
    if (permission == LocationPermission.deniedForever) {
      return _handleLocationFetchingErrors(
          'Location permissions are permanently denied.');
    }

    try {
      // Fetch position with high accuracy
      Position position = await Geolocator.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.best),
      );

      kLogger.green(
          'Location fetched: [Lat: ${position.latitude}, Lng: ${position.longitude}]');
      return position;
    } catch (e) {
      return _handleLocationFetchingErrors('Failed to fetch location: $e');
    }
  }

  Position? _handleLocationFetchingErrors(String errorMessage) {
    kLogger.red(errorMessage);
    emit(
      state.copyWith(
        getCurrentWeatherStatus: RequestStatus.error,
        getTheNextFiveDaysWeatherStatus: RequestStatus.error,
        getCurrentWeatherErrorMessage: errorMessage,
      ),
    );
    return null;
  }

  ///* Fetch weather data (Current Weather and Next 5 Days Weather)
  Future<void> fetchWeatherData() async {
    emit(state.copyWith(
      getCurrentWeatherStatus: RequestStatus.loading,
      getTheNextFiveDaysWeatherStatus: RequestStatus.loading,
    ));

    final position = await _getCurrentLocation();
    if (position == null) return;

    // Run both requests in parallel
    await Future.wait([
      getCurrentWeatherWithPosition(position),
      getNextFiveDaysWeatherWithPosition(position),
    ]);
  }

  ///* Get Current Weather
  Future<void> getCurrentWeatherWithPosition(Position position) async {
    final result = await _homeRepository.getCurrentWeather(
        position.latitude, position.longitude);
    result.fold(
      (failure) => emit(state.copyWith(
        getCurrentWeatherStatus: RequestStatus.error,
        getCurrentWeatherErrorMessage: failure.message,
      )),
      (weather) => emit(state.copyWith(
        getCurrentWeatherStatus: RequestStatus.success,
        currentWeather: weather,
      )),
    );
  }

  ///* Get Current Weather
  Future<void> getNextFiveDaysWeatherWithPosition(Position position) async {
    final result = await _homeRepository.getNextFiveDaysWeather(
        position.latitude, position.longitude);
    result.fold(
      (failure) => emit(state.copyWith(
        getTheNextFiveDaysWeatherStatus: RequestStatus.error,
        getTheNextFiveDaysWeatherErrorMessage: failure.message,
      )),
      (weather) => emit(state.copyWith(
        getTheNextFiveDaysWeatherStatus: RequestStatus.success,
        nextFiveDaysWeather: weather,
      )),
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
}
