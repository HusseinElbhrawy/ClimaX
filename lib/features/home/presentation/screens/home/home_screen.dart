import 'package:climax/core/utils/constant.dart';
import 'package:climax/features/home/presentation/widget/home/other_weather_days_widget.dart';
import 'package:climax/features/home/presentation/widget/home/today_and_next_days_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/home/custom_text_date_widget.dart';
import '../../widget/home/home_app_bar_widget.dart';
import '../../widget/home/main_weather_info_widget.dart';
import '../../widget/home/weather_secondary_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBarWidget(),
      body: SingleChildScrollView(
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
            const MainWeatherInfoWidget(),
            const WeatherSecondaryWidget(),
            16.verticalSpace,
            const TodayAndNextDaysButtonWidget(),
            const OtherWeatherDaysWidget(),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
