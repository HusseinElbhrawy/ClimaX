import 'package:climax/core/utils/app_assets.dart';
import 'package:climax/core/utils/app_colors.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainWeatherInfoWidget extends StatelessWidget {
  const MainWeatherInfoWidget({
    super.key,
  });

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
                child: Text(
                  '15°',
                  style: getBoldStyle(
                    fontSize: 84.sp,
                    color: context.whiteColor.withValues(alpha: 0.75),
                  ),
                ),
              ),
              PositionedDirectional(
                bottom: 28.h,
                start: 16.w,
                child: Text(
                  'Heavy Cloudy',
                  style: getMediumStyle(
                    fontSize: 16.sp,
                    color: context.whiteColor.withValues(alpha: 0.75),
                  ),
                ),
              ),
              PositionedDirectional(
                top: -75.h,
                start: 16.w,
                child: Image.asset(
                  AppImageAssets.heavyCloud,
                  width: 160.w,
                  height: 160.h,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
