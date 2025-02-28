import 'package:climax/core/enums/request_state.dart';
import 'package:climax/core/widgets/custom_error_widget.dart';
import 'package:climax/core/widgets/custom_loading_widget.dart';
import 'package:climax/features/home/logic/home/home_cubit.dart';
import 'package:climax/features/home/logic/home/home_state.dart';
import 'package:climax/features/home/presentation/widget/home/home_loaded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return previous.getCurrentWeatherStatus !=
                current.getCurrentWeatherStatus ||
            previous.getTheNextFiveDaysWeatherStatus !=
                current.getTheNextFiveDaysWeatherStatus;
      },
      builder: (context, state) {
        if (state.getCurrentWeatherStatus == RequestStatus.loading ||
            state.getTheNextFiveDaysWeatherStatus == RequestStatus.loading ||
            state.getTheNextFiveDaysWeatherStatus == RequestStatus.initial ||
            state.getCurrentWeatherStatus == RequestStatus.initial) {
          return const CustomLoadingWidget();
        } else if (state.getCurrentWeatherStatus == RequestStatus.error ||
            state.getTheNextFiveDaysWeatherStatus == RequestStatus.error) {
          return CustomErrorWidget(
            errorMessage: state.getCurrentWeatherErrorMessage!,
            onRetry: () {
              context.read<HomeCubit>().getCurrentWeather();
              context.read<HomeCubit>().getNextFiveDaysWeather();
            },
          );
        } else {
          return const HomeLoadedWidget();
        }
      },
    );
  }
}
