import 'package:climax/config/routes/app_navigation.dart';
import 'package:climax/config/routes/app_routes.dart';
import 'package:climax/config/routes/route_observer.dart';
import 'package:climax/config/theme/light_theme.dart';
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
      builder: (context, child) => MaterialApp(
        title: AppStrings.appName,
        color: AppColors.primaryColor,
        supportedLocales: const [Locale('ar'), Locale('en')],
        locale: const Locale('en'),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        navigatorKey: AppNavigation.navigatorKey,
        navigatorObservers: [kRouteObserver],
        theme: kLightTheme,
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        initialRoute: Routes.homeRoute,
      ),
    );
  }
}
