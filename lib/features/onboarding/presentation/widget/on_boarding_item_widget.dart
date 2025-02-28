import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:climax/features/onboarding/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({
    super.key,
    required this.item,
  });
  final OnBoardingModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 1.sw,
      // height: 1.sh,
      color: item.bgColor,
      padding: EdgeInsets.all(22.w),
      child: Column(
        spacing: 12.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          (kToolbarHeight + 24).verticalSpace,
          Center(
            child: SvgPicture.asset(
              item.imagePath,
              height: .3.sh,
              width: .5.sw,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            item.title,
            style: getRegularStyle(
              color: context.defaultHintColor,
              fontSize: 40,
            ),
          ),
          Text(
            item.subTitle,
            style: getBoldStyle(
              color: context.defaultTextColor,
              fontSize: 40,
            ),
          ),
          Text(
            item.details,
            textAlign: TextAlign.justify,
            maxLines: null,
            style: getRegularStyle(
              color: context.defaultTextColor,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: item.buttonColor,
              foregroundColor: item.buttonTextColor,
            ),
            onPressed: item.onPress,
            child: Text(item.buttonText ?? ''),
          ),
        ],
      ),
    );
  }
}
