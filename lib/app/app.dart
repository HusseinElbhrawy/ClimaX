import 'package:climax/config/routes/app_navigation.dart';
import 'package:climax/config/routes/app_routes.dart';
import 'package:climax/config/theme/dark_theme.dart';
import 'package:climax/config/theme/light_theme.dart';
import 'package:climax/config/theme/theme_provider.dart';
import 'package:climax/core/utils/app_colors.dart';
import 'package:climax/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => ValueListenableBuilder(
        valueListenable: ThemeManager.themeNotifier,
        builder: (BuildContext context, themeMode, Widget? child) {
          return MaterialApp(
            title: AppStrings.appName,
            color: AppColors.primaryColor,
            supportedLocales: const [Locale('ar'), Locale('en')],
            locale: const Locale('en'),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            navigatorKey: AppNavigation.navigatorKey,
            theme: kLightTheme,
            darkTheme: kDarkTheme,
            themeMode: themeMode,
            initialRoute: Routes.homeRoute,
          );
        },
      ),
    );
  }
}
