import 'package:flutter/material.dart';

class CustomRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  String? previousRouteName;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (previousRoute is PageRoute) {
      previousRouteName = previousRoute.settings.name;
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute) {
      previousRouteName = previousRoute.settings.name;
    }
  }
}

final RouteObserver<PageRoute<dynamic>> kRouteObserver = CustomRouteObserver();
