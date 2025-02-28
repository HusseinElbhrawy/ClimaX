import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchScreenTitleWidget extends StatelessWidget {
  const CustomSearchScreenTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Pick Location',
      style: getSemiBoldStyle(
        color: context.defaultTextColor,
        fontSize: 22.sp,
      ),
    );
  }
}
