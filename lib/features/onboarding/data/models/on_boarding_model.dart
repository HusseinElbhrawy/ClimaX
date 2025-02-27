import 'package:flutter/material.dart';

class OnBoardingModel {
  final String imagePath;
  final Color bgColor;
  final String title;
  final String subTitle;
  final String details;

  final String? buttonText;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final VoidCallback? onPress;

  OnBoardingModel({
    required this.imagePath,
    required this.bgColor,
    required this.title,
    required this.subTitle,
    required this.details,
    this.buttonText,
    this.buttonColor,
    this.buttonTextColor,
    this.onPress,
  });
}
