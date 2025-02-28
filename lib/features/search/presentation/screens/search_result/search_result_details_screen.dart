import 'package:climax/core/enums/request_state.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:climax/core/widgets/custom_error_widget.dart';
import 'package:climax/core/widgets/custom_loading_widget.dart';
import 'package:climax/features/search/logic/search_cubit.dart';
import 'package:climax/features/search/logic/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/search_result_loaded_widget.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        switch (state.searchRequestStatus) {
          case RequestStatus.initial:
            return Center(
              child: Text(
                'Please enter search name to search',
                style: getMediumStyle(
                  color: context.defaultTextColor,
                ),
              ),
            );
          case RequestStatus.loading:
            return const CustomLoadingWidget();
          case RequestStatus.success:
            return const SearchResultLoadedWidget();
          case RequestStatus.error:
            return CustomErrorWidget(
              errorMessage: state.searchErrorMessage!,
              onRetry: () => context.read<SearchCubit>().searchWithCityName(),
            );
        }
      },
    );
  }
}
