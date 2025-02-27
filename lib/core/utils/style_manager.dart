import 'package:climax/core/utils/app_colors.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/routes/app_navigation.dart';
import 'fonts_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: AppFonts.chillax,
    color: color,
    fontWeight: fontWeight,
  );
}

// regular style

TextStyle getRegularStyle({double? fontSize, Color? color}) {
  return _getTextStyle(
    fontSize?.sp ?? FontSize.s14.sp,
    AppFontsWeight.regular,
    color ?? AppNavigation.navigatorKey.currentContext!.defaultTextColor,
  );
}

// medium style

TextStyle getMediumStyle({double? fontSize, Color? color}) {
  return _getTextStyle(
    fontSize?.sp ?? FontSize.s14.sp,
    AppFontsWeight.medium,
    color ?? AppNavigation.navigatorKey.currentContext!.defaultTextColor,
  );
}

// light style
TextStyle getLightStyle({double? fontSize, Color? color}) {
  return _getTextStyle(
    fontSize?.sp ?? FontSize.s14.sp,
    AppFontsWeight.light,
    color ?? AppNavigation.navigatorKey.currentContext!.defaultTextColor,
  );
}

// bold style

TextStyle getBoldStyle({double? fontSize, Color? color}) {
  return _getTextStyle(
    fontSize?.sp ?? FontSize.s14.sp,
    AppFontsWeight.bold,
    color ?? AppColors.black,
  );
}

// semibold style

TextStyle getSemiBoldStyle({double? fontSize, Color? color}) {
  return _getTextStyle(
    fontSize?.sp ?? FontSize.s14.sp,
    AppFontsWeight.semiBold,
    color ?? AppNavigation.navigatorKey.currentContext!.defaultTextColor,
  );
}
