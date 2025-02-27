import 'dart:async';

import 'package:climax/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_routes.dart';
import '../widget/app_logo_widget.dart';
import '../widget/custom_app_name_with_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(
      const Duration(seconds: 2),
      () => context.navigateToWithReplacementAndClearStack(
        Routes.onboardingRoute,
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 32.h,
          children: const [
            AppLogoWidget(),
            CustomAppNameWithAnimationWidget(),
          ],
        ),
      ),
    );
  }
}
