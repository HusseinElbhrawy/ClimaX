import 'package:climax/core/utils/constant.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/widgets/custom_leading_back_button_widget.dart';
import 'package:climax/features/home/presentation/widget/home/custom_text_date_widget.dart';
import 'package:climax/features/home/presentation/widget/home/main_weather_info_widget.dart';
import 'package:climax/features/home/presentation/widget/home/weather_secondary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultDetailsScreen extends StatelessWidget {
  const SearchResultDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomLeadingBackButtonWidget(
          color: context.defaultTextColor,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(
          start: AppConstant.defaultPaddingValue.w,
          end: AppConstant.defaultPaddingValue.w,
          bottom: (AppConstant.defaultPaddingValue.h / 2),
        ),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12.h,
          children: [
            const LocationTextWidget(),
            const CustomTextDateWidget(),
            32.verticalSpace,
            const MainWeatherInfoWidget(),
            const WeatherSecondaryWidget(
              humidity: '12',
              maxTemp: '12',
              windSpeed: '12',
            ),
          ],
        ),
      ),
    );
  }
}
