import 'package:climax/config/routes/app_routes.dart';
import 'package:climax/core/logger/logs.dart';
import 'package:climax/core/utils/app_colors.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/features/home/presentation/widget/home/other_days_weather_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherWeatherDaysWidget extends StatefulWidget {
  const OtherWeatherDaysWidget({
    super.key,
    this.isComeFromHomeScree = false,
  });

  final bool isComeFromHomeScree;

  @override
  State<OtherWeatherDaysWidget> createState() => _OtherWeatherDaysWidgetState();
}

class _OtherWeatherDaysWidgetState extends State<OtherWeatherDaysWidget> {
  int currentSelectedItemIndex = 0;

  void _updateIndex(int newIndex) {
    if (newIndex == currentSelectedItemIndex) {
      return;
    } else {
      if (newIndex > 0 && widget.isComeFromHomeScree == false) {
        context.navigateTo(Routes.weatherDetailsRoute);
      } else {
        setState(() {
          currentSelectedItemIndex = newIndex;
        });
      }
    }

    kLogger.green("Current Selected Item is $currentSelectedItemIndex");
  }

  Color _getBgColor(int index) {
    if (currentSelectedItemIndex == index) {
      return !widget.isComeFromHomeScree
          ? AppColors.primaryColor
          : AppColors.white;
    }
    return !widget.isComeFromHomeScree
        ? AppColors.white
        : AppColors.heavyCloudy;
  }

  Color _getTextColor(int index) {
    if (currentSelectedItemIndex == index) {
      return !widget.isComeFromHomeScree
          ? AppColors.white
          : AppColors.primaryColor;
    }
    return !widget.isComeFromHomeScree
        ? AppColors.primaryColor
        : AppColors.white;
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
                bgColor: _getBgColor(index),
                onTap: () => _updateIndex(index),
                textColor: _getTextColor(index),
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
