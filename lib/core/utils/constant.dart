import 'package:climax/app/injector.dart';
import 'package:climax/core/utils/app_assets.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/features/onboarding/data/models/on_boarding_model.dart';
import 'package:climax/features/onboarding/logic/on_barding_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

final kDotEnv = serviceLocator<DotEnv>();

class AppConstant {
  const AppConstant._();
  static const AppConstant _instance = AppConstant._();
  factory AppConstant() => _instance;

  static Widget horizontalDivider() => const Divider(color: Colors.transparent);
  static Widget verticalDivider() =>
      const VerticalDivider(color: Colors.transparent);

  static const int defaultPaddingValue = 16;

  static List<OnBoardingModel> onBoardingItems(
          BuildContext context, LiquidController liquidController) =>
      [
        OnBoardingModel(
          imagePath: AppSvgAssets.onboarding1,
          bgColor: context.scaffoldBackgroundColor,
          title: 'Easy',
          subTitle: 'To Use',
          details:
              "🌍 Get real-time weather updates with accurate forecasts to plan your day effortlessly.",
          buttonColor: context.primaryColor,
          buttonTextColor: context.whiteColor,
          buttonText: 'Next',
          onPress: () {
            liquidController.animateToPage(page: 1);
          },
        ),
        OnBoardingModel(
          imagePath: AppSvgAssets.onboarding2,
          bgColor: context.primaryColor,
          title: 'Seamless ',
          subTitle: 'Experience',
          details:
              "☔ Stay prepared with detailed temperature, rain, and wind conditions anytime, anywhere.",
          buttonColor: context.whiteColor,
          buttonTextColor: context.blackColor,
          buttonText: 'Next',
          onPress: () {
            liquidController.animateToPage(page: 2);
          },
        ),
        OnBoardingModel(
          imagePath: AppSvgAssets.onboarding3,
          bgColor: const Color(0xffE71B5E),
          title: 'Stay',
          subTitle: 'Updated Anytime',
          details:
              "📱 Experience a sleek and easy-to-use weather app designed for your daily needs.",
          buttonColor: context.whiteColor,
          buttonTextColor: context.blackColor,
          buttonText: 'Get Started',
          onPress: () async {
            await serviceLocator<OnBardingService>().navigateToHome(context);
          },
        ),
      ];
}
