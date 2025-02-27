import 'package:climax/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAssets.logo,
      alignment: Alignment.center,
      cacheHeight: 200.h.toInt(),
      cacheWidth: 200.w.toInt(),
      fit: BoxFit.contain,
    ).animate().flip().fadeIn();
  }
}
