import 'package:flutter/material.dart';

class AppConstant {
  const AppConstant._();
  static const AppConstant _instance = AppConstant._();
  factory AppConstant() => _instance;

  static Widget horizontalDivider() => const Divider(color: Colors.transparent);
  static Widget verticalDivider() =>
      const VerticalDivider(color: Colors.transparent);

  static const int defaultPaddingValue = 16;
}
