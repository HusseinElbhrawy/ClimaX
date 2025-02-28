import 'package:climax/core/enums/request_state.dart';
import 'package:climax/core/logger/logs.dart';
import 'package:climax/features/search/data/repositories/search_repository.dart';
import 'package:climax/features/search/logic/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
    this._searchRepository,
  ) : super(const SearchState());

  final SearchRepository _searchRepository;

  final TextEditingController searchController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> searchWithCityName() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(searchRequestStatus: RequestStatus.loading));

      final result =
          await _searchRepository.searchWithCityName(searchController.text);
      result.fold(
        (failure) => emit(
          state.copyWith(
            searchErrorMessage: failure.message,
            searchRequestStatus: RequestStatus.error,
          ),
        ),
        (weather) {
          searchController.clear();
          emit(
            state.copyWith(
              searchRequestStatus: RequestStatus.success,
              searchResult: weather,
            ),
          );
        },
      );
    }
  }

  @override
  Future<void> close() {
    kLogger.red('Search Cubit Closed');
    searchController.dispose();
    return super.close();
  }
}
