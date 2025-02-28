import 'package:climax/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: LottieBuilder.asset(
          AppLottieAssets.loading,
          height: 120.h,
          width: 120.w,
        ),
      ),
    );
  }
}
