import 'package:climax/core/api/end_point.dart';
import 'package:climax/core/logger/logs.dart';
import 'package:climax/core/utils/constant.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/features/home/logic/home/home_cubit.dart';
import 'package:climax/features/home/presentation/widget/home/other_weather_days_widget.dart';
import 'package:climax/features/home/presentation/widget/home/today_and_next_days_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../widget/home/custom_text_date_widget.dart';
import '../../widget/home/home_app_bar_widget.dart';
import '../../widget/home/main_weather_info_widget.dart';
import '../../widget/home/weather_secondary_widget.dart';

class HomeLoadedWidget extends StatelessWidget {
  const HomeLoadedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final currentWeather = cubit.state.currentWeather;
    return Scaffold(
      appBar: const HomeAppBarWidget(),
      body: LiquidPullToRefresh(
        onRefresh: () async {
          await Future.wait(
            [
              context.read<HomeCubit>().fetchWeatherData(),
              // context.read<HomeCubit>().getNextFiveDaysWeather(),
            ],
          );
        },
        color: context.primaryColor,
        showChildOpacityTransition: false,
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.only(
            start: AppConstant.defaultPaddingValue.w,
            end: AppConstant.defaultPaddingValue.w,
            bottom: (AppConstant.defaultPaddingValue.h / 2),
          ),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12.h,
            children: [
              const LocationTextWidget(),
              const CustomTextDateWidget(),
              32.verticalSpace,
              InkWell(
                onTap: () {
                  kLogger.red(currentWeather.weather.first.icon);
                },
                child: MainWeatherInfoWidget(
                  temp: currentWeather!.main.temp.toStringAsFixed(1),
                  status: currentWeather.weather.first.main,
                  imagePath:
                      "${EndPoint.baseImageURL}/${currentWeather.weather.first.icon.trim()}@4x.png",

                  // imagePath:
                  //     cubit.getWeatherImage(currentWeather.weather.first.main),
                ),
              ),
              WeatherSecondaryWidget(
                humidity: currentWeather.main.humidity.toString(),
                windSpeed: currentWeather.wind.speed.toString(),
                maxTemp: currentWeather.main.tempMax.toString(),
              ),
              16.verticalSpace,
              const TodayAndNextDaysButtonWidget(),
              const OtherWeatherDaysWidget(),
              16.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
