import 'package:climax/core/utils/app_assets.dart';
import 'package:climax/core/utils/constant.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key, required this.errorMessage, required this.onRetry});
  final String errorMessage;
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstant.defaultPaddingValue.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 16.h,
          children: [
            Center(
              child: LottieBuilder.asset(
                AppLottieAssets.error,
                // height: 120.h,
                // width: 120.w,
              ),
            ),
            Text(
              errorMessage,
              style: getMediumStyle(
                color: context.defaultTextColor,
                fontSize: 16.sp,
              ),
            ),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
