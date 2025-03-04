import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainInfoWeatherDataStatusLogoWidget extends StatelessWidget {
  const MainInfoWeatherDataStatusLogoWidget({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
  });
  final String imagePath;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      width: width ?? 160.w,
      height: height ?? 160.h,
      fit: BoxFit.contain,
    );
  }
}
