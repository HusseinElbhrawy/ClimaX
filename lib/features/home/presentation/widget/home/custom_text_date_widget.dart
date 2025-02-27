import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextDateWidget extends StatelessWidget {
  const CustomTextDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Monday, 2 May');
  }
}

class LocationTextWidget extends StatelessWidget {
  const LocationTextWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      'Tanta',
      style: getBoldStyle(
        fontSize: 36.sp,
        color: context.defaultTextColor,
      ),
    );
  }
}
