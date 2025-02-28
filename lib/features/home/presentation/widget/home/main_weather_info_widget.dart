import 'package:climax/core/utils/app_assets.dart';
import 'package:climax/core/utils/app_colors.dart';
import 'package:climax/features/home/logic/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main_info_weather_data_status_logo_widget.dart';
import 'main_info_weather_data_status_widget.dart';
import 'main_info_weather_data_temp_text_widget.dart';

class MainWeatherInfoWidget extends StatelessWidget {
  const MainWeatherInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var currentWeather = context.read<HomeCubit>().state.currentWeather;
    return Padding(
      padding: EdgeInsets.only(bottom: 32.h),
      child: Material(
        elevation: 8.sp,
        shadowColor: AppColors.heavyCloudy,
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.heavyCloudy,
        child: SizedBox(
          height: 200.h,
          width: 1.sw,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              PositionedDirectional(
                top: 36.h,
                end: 22.w,
                child: MainInfoWeatherDataTempTextWidget(
                  temp: currentWeather!.main.temp.toStringAsFixed(1),
                ),
              ),
              PositionedDirectional(
                bottom: 28.h,
                start: 16.w,
                child: MainInfoWeatherDataStatusWidget(
                  status: currentWeather.weather.first.main,
                ),
              ),

              // Todo: Change Image Depend on Weather.main
              PositionedDirectional(
                top: -75.h,
                start: 16.w,
                child: const MainInfoWeatherDataStatusLogoWidget(
                  imagePath: AppImageAssets.heavyCloud,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
