import 'package:climax/core/utils/app_strings.dart';
import 'package:climax/features/onboarding/presentation/screens/on_boarding_screen.dart';
import 'package:climax/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = '/splash';
  static const String onboardingRoute = '/onboarding';
  static const String homeRoute = '/home';
  static const String searchRoute = '/search';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return CupertinoPageRoute(
          builder: (_) => const SplashScreen(),
          settings: routeSettings,
        );
      case Routes.onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
          settings: routeSettings,
        );
      // case Routes.homeRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgetPasswordScreen(),
      //     settings: routeSettings,
      //   );
      // case Routes.searchRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const ConfirmPhoneNumberScreen(),
      //     settings: routeSettings,
      //   );
      //! Default
      default:
        return _unDefinedRoute();
    }
  }

  static MaterialPageRoute<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(
            AppStrings.noRouteFound,
          ),
        ),
      ),
    );
  }
}
