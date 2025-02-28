// import 'package:climax/core/enums/request_state.dart';
// import 'package:climax/core/logger/logs.dart';
// import 'package:climax/core/widgets/custom_error_widget.dart';
// import 'package:climax/core/widgets/custom_loading_widget.dart';
// import 'package:climax/features/home/logic/home/home_cubit.dart';
// import 'package:climax/features/home/logic/home/home_state.dart';
// import 'package:climax/features/home/presentation/widget/home/home_loaded_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   void _getData() async {
//     // await Future.wait(
//     //   [
//     //     context.read<HomeCubit>().getCurrentWeather(),
//     //     context.read<HomeCubit>().getNextFiveDaysWeather(),
//     //   ],
//     // );
//   }

//   @override
//   void initState() {
//     _getData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       // buildWhen: (previous, current) {
//       //   return previous.getCurrentWeatherStatus !=
//       //           current.getCurrentWeatherStatus ||
//       //       previous.getTheNextFiveDaysWeatherStatus !=
//       //           current.getTheNextFiveDaysWeatherStatus;
//       // },
//       builder: (context, state) {
//         kLogger.blue("Current State is ${state.getCurrentWeatherStatus}");
//         kLogger.blue(
//             "Next 5 Days State is ${state.getTheNextFiveDaysWeatherStatus}");
//         if (state.getCurrentWeatherStatus == RequestStatus.loading ||
//             state.getTheNextFiveDaysWeatherStatus == RequestStatus.loading ||
//             state.getTheNextFiveDaysWeatherStatus == RequestStatus.initial ||
//             state.getCurrentWeatherStatus == RequestStatus.initial) {
//           return const CustomLoadingWidget();
//         } else if (state.getCurrentWeatherStatus == RequestStatus.error ||
//             state.getTheNextFiveDaysWeatherStatus == RequestStatus.error) {
//           return CustomErrorWidget(
//             errorMessage: state.getCurrentWeatherErrorMessage ??
//                 state.getTheNextFiveDaysWeatherErrorMessage ??
//                 'Something went wrong',
//             onRetry: () {
//               context.read<HomeCubit>().getCurrentWeather();
//               context.read<HomeCubit>().getNextFiveDaysWeather();
//             },
//           );
//         } else {
//           return const HomeLoadedWidget();
//         }
//       },
//     );
//   }
// }

import 'package:climax/core/enums/request_state.dart';
import 'package:climax/core/logger/logs.dart';
import 'package:climax/core/widgets/custom_error_widget.dart';
import 'package:climax/core/widgets/custom_loading_widget.dart';
import 'package:climax/features/home/logic/home/home_cubit.dart';
import 'package:climax/features/home/logic/home/home_state.dart';
import 'package:climax/features/home/presentation/widget/home/home_loaded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _getData() async {
    context.read<HomeCubit>().fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        ///* Only rebuild when weather data or status changes
        return previous.getCurrentWeatherStatus !=
                current.getCurrentWeatherStatus ||
            previous.getTheNextFiveDaysWeatherStatus !=
                current.getTheNextFiveDaysWeatherStatus;
      },
      builder: (context, state) {
        kLogger
            .blue("Current Weather Status: ${state.getCurrentWeatherStatus}");
        kLogger.blue(
            "Next 5 Days Weather Status: ${state.getTheNextFiveDaysWeatherStatus}");

        if (state.getCurrentWeatherStatus == RequestStatus.loading ||
            state.getTheNextFiveDaysWeatherStatus == RequestStatus.loading ||
            state.getTheNextFiveDaysWeatherStatus == RequestStatus.initial ||
            state.getCurrentWeatherStatus == RequestStatus.initial) {
          return const CustomLoadingWidget();
        }

        if (state.getCurrentWeatherStatus == RequestStatus.error ||
            state.getTheNextFiveDaysWeatherStatus == RequestStatus.error) {
          ///* Prioritize the most relevant error message
          final errorMessage = state.getCurrentWeatherErrorMessage ??
              state.getTheNextFiveDaysWeatherErrorMessage ??
              'Something went wrong. Please try again.';

          return CustomErrorWidget(
            errorMessage: errorMessage,
            onRetry: _getData,
          );
        }

        ///* Ensure weather data is valid before rendering HomeLoadedWidget
        if (state.currentWeather == null || state.nextFiveDaysWeather.isEmpty) {
          return CustomErrorWidget(
            errorMessage: "Failed to load weather data.",
            onRetry: _getData,
          );
        }

        return const HomeLoadedWidget();
      },
    );
  }
}
