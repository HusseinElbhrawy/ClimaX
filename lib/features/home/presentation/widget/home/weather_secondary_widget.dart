import 'package:climax/core/utils/app_assets.dart';
import 'package:climax/features/home/data/models/weather_secondary_info_model.dart';
import 'package:climax/features/home/presentation/widget/home/weather_secondary_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherSecondaryWidget extends StatefulWidget {
  const WeatherSecondaryWidget({super.key});

  @override
  State<WeatherSecondaryWidget> createState() => _WeatherSecondaryWidgetState();
}

class _WeatherSecondaryWidgetState extends State<WeatherSecondaryWidget> {
  final List<WeatherSecondaryInfoModel> _data = [
    WeatherSecondaryInfoModel(
      imagePath: AppImageAssets.windSpeed,
      title: 'Wind Speed',
      value: '25 km/h',
    ),
    WeatherSecondaryInfoModel(
      imagePath: AppImageAssets.humidity,
      title: 'Humidity',
      value: '65',
    ),
    WeatherSecondaryInfoModel(
      imagePath: AppImageAssets.maxTemp,
      title: 'Max Temp',
      value: '17°C',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        // alignment: WrapAlignment.spaceAround,
        spacing: 12.w,
        // runSpacing: 16.h,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          3,
          (index) {
            return WeatherSecondaryInfoWidget(model: _data[index]);
          },
        ),
      ),
    );
    // return SizedBox(
    //   width: double.infinity,
    //   child: Wrap(
    //     // alignment: WrapAlignment.start,
    //     // crossAxisAlignment: WrapCrossAlignment.center,
    //     runAlignment: WrapAlignment.spaceBetween,
    //     // spacing: 12.w,
    //     // runSpacing: 16.h,
    //     children: List.generate(
    //       3,
    //       (index) {
    //         return WeatherSecondaryInfoWidget(
    //           model: WeatherSecondaryInfoModel(
    //             imagePath: AppImageAssets.windSpeed,
    //             title: 'Wind Speed',
    //             value: '25 km/h',
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    //   // child: LayoutBuilder(
    //   //   builder: (context, constraints) {
    //   //     double itemWidth = (constraints.maxWidth - (12.w * 3)) / 4;
    //   //     return ;
    //   //   },
    //   // ),
    // );
  }
}
