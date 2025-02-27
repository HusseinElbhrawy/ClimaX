import 'package:climax/core/logger/logs.dart';
import 'package:climax/core/utils/app_colors.dart';
import 'package:climax/features/home/presentation/widget/other_days_weather_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherWeatherDaysWidget extends StatefulWidget {
  const OtherWeatherDaysWidget({
    super.key,
  });

  @override
  State<OtherWeatherDaysWidget> createState() => _OtherWeatherDaysWidgetState();
}

class _OtherWeatherDaysWidgetState extends State<OtherWeatherDaysWidget> {
  int currentSelectedItemIndex = 0;

  void _updateIndex(int newIndex) {
    setState(() {
      currentSelectedItemIndex = newIndex;
    });

    kLogger.green("Current Selected Item is $currentSelectedItemIndex");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          7,
          (index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(end: 12.w),
              child: OtherDaysWeatherItemWidget(
                bgColor: currentSelectedItemIndex == index
                    ? AppColors.heavyCloudy
                    : AppColors.white,
                onTap: () => _updateIndex(index),
                textColor: currentSelectedItemIndex == index
                    ? AppColors.white
                    : AppColors.primaryColor,
              ),
            );
          },
        ),
      ),
    );
    // return Expanded(
    //   child: SizedBox(
    //     // height: 120.h,
    //     child: ListView.separated(
    // itemBuilder: (context, index) => OtherDaysWeatherItemWidget(
    //   bgColor: currentSelectedItemIndex == index
    //       ? AppColors.heavyCloudy
    //       : AppColors.white,
    //   onTap: () => _updateIndex(index),
    //   textColor: currentSelectedItemIndex == index
    //       ? AppColors.white
    //       : AppColors.primaryColor,
    // ),
    //       scrollDirection: Axis.horizontal,
    //       itemCount: 7,
    //       separatorBuilder: (BuildContext context, int index) {
    //         return 12.horizontalSpace;
    //       },
    //     ),
    //   ),
    // );
  }
}
