import 'package:climax/core/utils/fonts_manager.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:climax/core/utils/values_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';

ThemeData get kLightTheme => ThemeData(
      //* General Colors
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.lightBackground,
      primaryColorLight: AppColors.primaryColor,
      hintColor: AppColors.lightHintColor,
      cardColor: AppColors.lightCard,
      dividerColor: AppColors.lightDivider,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor,
        onPrimary: AppColors.white,
      ),

      //* Appbar ThemeData
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0.0,
        color: Colors.transparent,
        iconTheme: const IconThemeData(
          color: AppColors.black,
        ),
        titleTextStyle: getSemiBoldStyle(
          color: AppColors.black,
          fontSize: 16.sp,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.lightBackground,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      //* Text ThemeData
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.lightText,
          fontFamily: AppFonts.chillax,
        ),
        displayMedium: TextStyle(
          color: AppColors.lightText,
          fontFamily: AppFonts.chillax,
        ),
        displaySmall: TextStyle(
          color: AppColors.lightText,
          fontFamily: AppFonts.chillax,
        ),
        bodyLarge: TextStyle(
          color: AppColors.lightText,
          fontFamily: AppFonts.chillax,
        ),
        bodyMedium: TextStyle(
          color: AppColors.lightTextColor,
        ),
        bodySmall: TextStyle(
          color: AppColors.lightTextColor,
        ),
        headlineLarge: TextStyle(
          color: AppColors.lightText,
          fontFamily: AppFonts.chillax,
        ),
        headlineMedium: TextStyle(
          color: AppColors.lightText,
          fontFamily: AppFonts.chillax,
        ),
        headlineSmall: TextStyle(
          color: AppColors.lightText,
          fontFamily: AppFonts.chillax,
        ),
        titleLarge: TextStyle(
          color: AppColors.lightText,
          fontFamily: AppFonts.chillax,
        ),
        titleMedium: TextStyle(
          color: AppColors.lightText,
          fontFamily: AppFonts.chillax,
        ),
        titleSmall: TextStyle(
          color: AppColors.lightText,
          fontFamily: AppFonts.chillax,
        ),
        labelLarge: TextStyle(
          color: AppColors.lightText,
          fontFamily: AppFonts.chillax,
        ),
        labelMedium: TextStyle(
          color: AppColors.lightText,
          fontFamily: AppFonts.chillax,
        ),
        labelSmall: TextStyle(
          color: AppColors.lightText,
          fontFamily: AppFonts.chillax,
        ),
      ),

      //* Elevated Button ThemeData
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white,
          minimumSize: Size.fromHeight(48.h),
          fixedSize: Size.fromWidth(1.sw),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),

      //* Outline Button ThemeData
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.primaryColor,
          minimumSize: Size.fromHeight(48.h),
          fixedSize: Size.fromWidth(1.sw),
          enableFeedback: true,
          side: BorderSide(
            color: AppColors.primaryColor,
            width: AppSize.s1_5.r,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),

      //* Text Form Field ThemeData
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: AppColors.lightHintColor,
        prefixIconColor: AppColors.lightHintColor,
        contentPadding: EdgeInsets.all(AppPadding.p12.sp),
        hintStyle: const TextStyle(color: AppColors.lightHintColor),
        labelStyle: TextStyle(
          color: AppColors.darkLightText,
          fontSize: AppSize.s14.sp,
        ),
        errorStyle: const TextStyle(color: AppColors.red),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightHintColor,
            width: AppSize.s1_5.r,
          ),
          borderRadius: BorderRadius.circular(
            AppSize.s14.r,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightHintColor,
            width: AppSize.s1_5.r,
          ),
          borderRadius: BorderRadius.circular(
            AppSize.s14.r,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
            width: AppSize.s1_5.r,
          ),
          borderRadius: BorderRadius.circular(
            AppSize.s14.r,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: AppSize.s1_5.r,
          ),
          borderRadius: BorderRadius.circular(
            AppSize.s14.r,
          ),
        ),
      ),
    );
