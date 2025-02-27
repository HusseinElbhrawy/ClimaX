import 'package:climax/config/routes/app_routes.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

class OnBoardingSkipButtonWidget extends StatelessWidget {
  const OnBoardingSkipButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.navigateToWithReplacementAndClearStack(
          Routes.homeRoute,
        );
      },
      child: Text('Skip'),
    );
  }
}
