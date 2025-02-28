import 'package:climax/core/api/end_point.dart';
import 'package:climax/core/utils/app_colors.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/features/home/logic/home/home_state.dart';
import 'package:climax/features/home/presentation/widget/home/main_info_weather_data_status_logo_widget.dart';
import 'package:climax/features/home/presentation/widget/home/main_info_weather_data_status_widget.dart';
import 'package:climax/features/home/presentation/widget/home/main_info_weather_data_temp_text_widget.dart';
import 'package:climax/features/home/presentation/widget/home/weather_secondary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constant.dart';
import '../../../logic/home/home_cubit.dart';

class CustomWeatherDetailsMainInfoWidget extends StatelessWidget {
  const CustomWeatherDetailsMainInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 120.h),
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(100.r),
          topStart: Radius.circular(100.r),
        ),
      ),
      child: Container(
        height: 350.h,
        width: 1.sw,
        margin: EdgeInsets.symmetric(
          horizontal: AppConstant.defaultPaddingValue.w,
        ),
        transform: Matrix4.translationValues(0, -40.h, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.darkLightText,
        ),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                PositionedDirectional(
                  top: 36.h,
                  end: 22.w,
                  child: MainInfoWeatherDataTempTextWidget(
                    temp: state
                        .nextFiveDaysWeather![state.currentSelectedDayIndex]!
                        .main
                        .temp
                        .toStringAsFixed(1),
                  ),
                ),
                PositionedDirectional(
                  bottom: 28.h,
                  start: 16.w,
                  child: SizedBox(
                    width: .75.sw,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16.h,
                      children: [
                        MainInfoWeatherDataStatusWidget(
                          status: state
                              .nextFiveDaysWeather![
                                  state.currentSelectedDayIndex]!
                              .weather
                              .first
                              .main,
                        ),
                        WeatherSecondaryWidget(
                          humidity: state
                              .nextFiveDaysWeather![
                                  state.currentSelectedDayIndex]!
                              .main
                              .humidity
                              .toString(),
                          windSpeed: state
                              .nextFiveDaysWeather![
                                  state.currentSelectedDayIndex]!
                              .wind
                              .speed
                              .toString(),
                          maxTemp: state
                              .nextFiveDaysWeather![
                                  state.currentSelectedDayIndex]!
                              .main
                              .tempMax
                              .toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                PositionedDirectional(
                  top: -75.h,
                  start: 16.w,
                  child: MainInfoWeatherDataStatusLogoWidget(
                    imagePath:
                        "${EndPoint.baseImageURL}/${state.nextFiveDaysWeather![state.currentSelectedDayIndex]!.weather.first.icon.trim()}@4x.png",
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
