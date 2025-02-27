import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodayAndNextDaysButtonWidget extends StatelessWidget {
  const TodayAndNextDaysButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          'Today',
          style: getSemiBoldStyle(
            color: context.defaultTextColor,
            fontSize: 22.sp,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(0),
          ),
          onPressed: () {},
          child: Text('Next 7 days'),
        ),
      ],
    );
  }
}
