// ignore_for_file: use_build_context_synchronously

import 'package:climax/config/routes/app_routes.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBardingService {
  final SharedPreferences _sharedPreferences;

  OnBardingService(this._sharedPreferences);

  final String _onBoardingSeenKey = 'onBoardingSeen';

  Future<bool> _skipOnBoarding() async {
    return _sharedPreferences.setBool(_onBoardingSeenKey, true);
  }

  bool isOnBoardingSeen() {
    return _sharedPreferences.getBool(_onBoardingSeenKey) ?? false;
  }

  Future<void> navigateToHome(BuildContext context) async {
    _skipOnBoarding().then(
      (isCached) async {
        if (isCached) {
          Future.microtask(() {
            context.navigateToWithReplacementAndClearStack(Routes.homeRoute);
          });
        }
      },
    );
  }
}
