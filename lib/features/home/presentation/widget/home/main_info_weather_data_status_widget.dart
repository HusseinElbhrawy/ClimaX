import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainInfoWeatherDataStatusWidget extends StatelessWidget {
  const MainInfoWeatherDataStatusWidget({
    super.key,
    required this.status,
  });
  final String status;
  @override
  Widget build(BuildContext context) {
    return Text(
      status,
      style: getMediumStyle(
        fontSize: 16.sp,
        color: context.whiteColor.withValues(alpha: 0.75),
      ),
    );
  }
}
