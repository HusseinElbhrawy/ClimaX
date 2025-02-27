import 'package:climax/core/utils/app_colors.dart';
import 'package:climax/core/utils/constant.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:climax/features/home/data/models/weather_secondary_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherSecondaryInfoWidget extends StatelessWidget {
  const WeatherSecondaryInfoWidget({
    super.key,
    required this.model,
  });
  final WeatherSecondaryInfoModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(model.title),
        Container(
          padding: EdgeInsets.all(
            (AppConstant.defaultPaddingValue / 3).sp,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.heavyCloudy,
          ),
          child: Image.asset(
            model.imagePath,
            width: 40.w,
            height: 45.h,
          ),
        ),
        Text(
          model.value,
          style: getSemiBoldStyle(
            fontSize: 12.sp,
            color: context.defaultTextColor,
          ),
        ),
      ],
    );
  }
}
