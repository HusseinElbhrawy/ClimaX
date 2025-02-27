import 'package:climax/core/utils/app_colors.dart';
import 'package:climax/core/utils/values_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/style_manager.dart';

ThemeData get kDarkTheme => ThemeData.dark(useMaterial3: true).copyWith(
      //* Appbar ThemeData
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0.0,
        color: Colors.transparent,
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
        titleTextStyle: getSemiBoldStyle(
          color: AppColors.white,
          fontSize: 16.sp,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.darkBackground,
          statusBarIconBrightness: Brightness.light,
        ),
      ),

      //* Text Form Field ThemeData
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: AppColors.darkLightText,
        prefixIconColor: AppColors.darkLightText,
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
