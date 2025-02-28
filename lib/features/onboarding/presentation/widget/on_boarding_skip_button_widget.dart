import 'package:climax/app/injector.dart';
import 'package:climax/features/onboarding/logic/on_barding_service.dart';
import 'package:flutter/material.dart';

class OnBoardingSkipButtonWidget extends StatefulWidget {
  const OnBoardingSkipButtonWidget({
    super.key,
  });

  @override
  State<OnBoardingSkipButtonWidget> createState() =>
      _OnBoardingSkipButtonWidgetState();
}

class _OnBoardingSkipButtonWidgetState
    extends State<OnBoardingSkipButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async =>
          await serviceLocator<OnBardingService>().navigateToHome(context),
      child: const Text('Skip'),
    );
  }
}
