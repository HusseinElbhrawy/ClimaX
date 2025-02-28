import 'package:climax/core/enums/request_state.dart';
import 'package:climax/features/home/data/models/weather_model.dart';
import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  const SearchState({
    this.searchRequestStatus = RequestStatus.initial,
    this.searchErrorMessage,
    this.searchResult,
  });

  final RequestStatus searchRequestStatus;
  final String? searchErrorMessage;
  final WeatherModel? searchResult;

  @override
  List<Object?> get props =>
      [searchRequestStatus, searchErrorMessage, searchResult];

  SearchState copyWith({
    RequestStatus? searchRequestStatus,
    String? searchErrorMessage,
    WeatherModel? searchResult,
  }) {
    return SearchState(
      searchRequestStatus: searchRequestStatus ?? this.searchRequestStatus,
      searchErrorMessage: searchErrorMessage ?? this.searchErrorMessage,
      searchResult: searchResult ?? this.searchResult,
    );
  }
}
