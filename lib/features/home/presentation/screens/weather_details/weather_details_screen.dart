import 'package:climax/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constant.dart';
import '../../widget/home/other_weather_days_widget.dart';
import '../../widget/weather_details/custom_weather_details_main_info_widget.dart';
import '../../widget/weather_details/weather_details_app_bar_widget.dart';
import '../../widget/weather_details/weather_details_other_days_widget.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WeatherDetailsAppBarWidget(),
      backgroundColor: context.primaryColor,
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstant.defaultPaddingValue.w,
                ),
                child: const OtherWeatherDaysWidget(isComeFromHomeScree: true),
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomWeatherDetailsMainInfoWidget(),
            ),
          ];
        },
        body: const WeatherDetailsOtherDaysWidget(),
      ),
    );
  }
}
