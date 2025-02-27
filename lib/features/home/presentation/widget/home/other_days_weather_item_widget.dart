import 'package:climax/core/utils/app_assets.dart';
import 'package:climax/core/utils/constant.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherDaysWeatherItemWidget extends StatelessWidget {
  const OtherDaysWeatherItemWidget({
    super.key,
    required this.onTap,
    required this.bgColor,
    required this.textColor,
  });
  final VoidCallback onTap;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Material(
        borderRadius: BorderRadius.circular(12.r),
        color: bgColor,
        elevation: 8.r,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstant.defaultPaddingValue.w * 1.2,
            vertical: (AppConstant.defaultPaddingValue / 1.2).h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12.h,
            children: [
              Text(
                '15C',
                style: getMediumStyle(
                  color: textColor,
                ),
              ),
              Image.asset(
                AppImageAssets.heavyCloud,
                height: 24.h,
              ),
              Text(
                'Mon',
                style: getMediumStyle(
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
