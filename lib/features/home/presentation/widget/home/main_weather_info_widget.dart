import 'package:climax/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main_info_weather_data_status_widget.dart';
import 'main_info_weather_data_temp_text_widget.dart';

class MainWeatherInfoWidget extends StatelessWidget {
  const MainWeatherInfoWidget({
    super.key,
    required this.temp,
    required this.imagePath,
    required this.status,
  });
  final String temp;
  final String imagePath;
  final String status;
  @override
  Widget build(BuildContext context) {
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
                  temp: temp,
                  // temp: currentWeather!.main.temp.toStringAsFixed(1),
                ),
              ),
              PositionedDirectional(
                bottom: 28.h,
                start: 16.w,
                child: MainInfoWeatherDataStatusWidget(
                  // status: currentWeather.weather.first.main,
                  status: status,
                ),
              ),
              PositionedDirectional(
                top: -75.h,
                start: 16.w,
                child: Image.network(
                  imagePath,
                ),
                // child: MainInfoWeatherDataStatusLogoWidget(
                //   imagePath: imagePath,
                //   // cubit.getWeatherImage(currentWeather.weather.first.main),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
