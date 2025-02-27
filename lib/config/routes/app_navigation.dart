import 'package:flutter/material.dart';

class AppNavigation {
  AppNavigation._internal();
  static final AppNavigation _instance = AppNavigation._internal();
  factory AppNavigation() => _instance;

  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static NavigatorState? get navigator => _navigatorKey.currentState;

  static BuildContext? get context => navigator?.overlay?.context;
  static BuildContext? get tempContext => _navigatorKey.currentContext;
}
