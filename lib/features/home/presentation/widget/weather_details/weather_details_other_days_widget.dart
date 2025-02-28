import 'package:climax/core/utils/app_assets.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/features/home/presentation/widget/home/main_info_weather_data_status_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constant.dart';

class WeatherDetailsOtherDaysWidget extends StatelessWidget {
  const WeatherDetailsOtherDaysWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: AppConstant.defaultPaddingValue.w,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstant.defaultPaddingValue.w,
          vertical: (AppConstant.defaultPaddingValue.h) / 2,
        ),
        child: Row(
          children: [
            const Expanded(child: Text('2 May , Friday')),
            Expanded(
              child: Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '18/',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(
                        text: '8',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MainInfoWeatherDataStatusLogoWidget(
                    imagePath: AppImageAssets.heavyCloud,
                    height: 40.h,
                    width: 40.w,
                  ),
                  const Text('Heavy Cloudy'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
