import 'package:cached_network_image/cached_network_image.dart';
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
    required this.dayName,
    required this.temp,
    required this.image,
  });
  final VoidCallback onTap;
  final Color bgColor;
  final Color textColor;
  final String dayName;
  final String temp;
  final String image;

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
                '$temp °C',
                style: getMediumStyle(
                  color: textColor,
                ),
              ),
              CachedNetworkImage(
                // AppImageAssets.heavyCloud,
                imageUrl: image,
                height: 24.h,
              ),
              Text(
                dayName,
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
