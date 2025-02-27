import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:climax/core/utils/app_strings.dart';
import 'package:climax/core/utils/fonts_manager.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppNameWithAnimationWidget extends StatelessWidget {
  const CustomAppNameWithAnimationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      softWrap: true,
      textAlign: TextAlign.center,
      overflow: TextOverflow.visible,
      textWidthBasis: TextWidthBasis.longestLine,
      textHeightBehavior: TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: true,
      ),
      style: TextStyle(
        fontSize: 30.sp,
        color: context.defaultTextColor,
        fontFamily: AppFonts.chillax,
        fontWeight: FontWeight.w500,
      ),
      child: AnimatedTextKit(
        totalRepeatCount: 2,
        animatedTexts: [
          TypewriterAnimatedText(
            AppStrings.appName,
            speed: Duration(milliseconds: 100),
          ),
        ],
      ),
    ).animate().flip().fadeIn();
  }
}
