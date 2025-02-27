import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

TextStyle getRegularStyle({double? fontSize, required Color color}) {
  return _getTextStyle(
    fontSize?.sp ?? FontSize.s14.sp,
    AppFontsWeight.regular,
    color,
  );
}

// medium style

TextStyle getMediumStyle({double? fontSize, required Color color}) {
  return _getTextStyle(
    fontSize?.sp ?? FontSize.s14.sp,
    AppFontsWeight.medium,
    color,
  );
}

// light style
TextStyle getLightStyle({double? fontSize, required Color color}) {
  return _getTextStyle(
    fontSize?.sp ?? FontSize.s14.sp,
    AppFontsWeight.light,
    color,
  );
}

// bold style

TextStyle getBoldStyle({double? fontSize, required Color color}) {
  return _getTextStyle(
    fontSize?.sp ?? FontSize.s14.sp,
    AppFontsWeight.bold,
    color,
  );
}

// semibold style

TextStyle getSemiBoldStyle({double? fontSize, required Color color}) {
  return _getTextStyle(
    fontSize?.sp ?? FontSize.s14.sp,
    AppFontsWeight.semiBold,
    color,
  );
}
