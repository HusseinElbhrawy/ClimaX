import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  //! Default Size
  Size get size => MediaQuery.sizeOf(this);
  double get height => size.height;
  double get width => size.width;

  //! Default Padding
  double get topPadding => MediaQuery.of(this).viewPadding.top;
  double get bottomPadding => MediaQuery.of(this).viewPadding.bottom;

  //! Dark or Light Theme
  bool get isDarkTheme =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;

  //! is Portrait
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  //! Text Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  Color get defaultTextColor => Theme.of(this).textTheme.headlineLarge!.color!;
  Color get defaultHintColor => Theme.of(this).hintColor;
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
  Color get primaryColorDark => Theme.of(this).primaryColorDark;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get thirdColor => Theme.of(this).colorScheme.tertiary;
  Color get shadowColor => Theme.of(this).colorScheme.shadow;
  Color get whiteColor => Colors.white;
  Color get blackColor => Colors.black;
  Color get greyColor => Colors.grey;
  Color get redColor => Colors.red;
  Color get greenColor => Colors.green;

  //! Data
  double get aspectRatio => size.aspectRatio;

  //! Navigation
  Future navigateTo(String routeName, [Object? arguments]) =>
      Navigator.of(this).pushNamed(
        routeName,
        arguments: arguments,
      );

  Future<dynamic> navigateToWithReplacementNamed(String routeName,
          {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(
        routeName,
        arguments: arguments,
      );

  Future<dynamic> navigateToWithReplacementAndClearStack(String routeName,
          {Object? arguments}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: arguments,
      );

  void pop() => Navigator.of(this).pop();

  Future<bool> mayPop() => Navigator.of(this).maybePop();
}
