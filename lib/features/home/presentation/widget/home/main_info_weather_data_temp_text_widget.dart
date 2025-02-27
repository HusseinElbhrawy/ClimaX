import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainInfoWeatherDataTempTextWidget extends StatelessWidget {
  const MainInfoWeatherDataTempTextWidget({
    super.key,
    required this.temp,
  });
  final String temp;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$temp°',
      style: getBoldStyle(
        fontSize: 84.sp,
        color: context.whiteColor.withValues(alpha: 0.75),
      ),
    );
  }
}
