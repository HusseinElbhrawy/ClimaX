const String _imagePath = 'assets/images';
const String _lottiePath = 'assets/lottie';
const String _svgPath = 'assets/svg';

class AppImageAssets {
  const AppImageAssets._();
  static const AppImageAssets _instance = AppImageAssets._();
  factory AppImageAssets() => _instance;

  static String logo = '$_imagePath/logo.png';
}

class AppSvgAssets {
  const AppSvgAssets._();
  static const AppSvgAssets _instance = AppSvgAssets._();
  factory AppSvgAssets() => _instance;

  //! Splash , OnBoarding , Auth Assets
  static const String onboarding1 = '$_svgPath/on_boarding/onboarding_1.svg';
  static const String onboarding2 = '$_svgPath/on_boarding/onboarding_2.svg';
  static const String onboarding3 = '$_svgPath/on_boarding/onboarding_3.svg';
  static const String onboarding4 = '$_svgPath/on_boarding/onboarding_4.svg';
}

class AppLottieAssets {
  AppLottieAssets._internal();
  static final AppLottieAssets _instance = AppLottieAssets._internal();
  factory AppLottieAssets() => _instance;

  static const String loading = '$_lottiePath/loading.json';
}
