import 'package:climax/core/utils/app_assets.dart';
import 'package:climax/features/home/data/models/weather_secondary_info_model.dart';
import 'package:climax/features/home/presentation/widget/home/weather_secondary_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/home/home_cubit.dart';

class WeatherSecondaryWidget extends StatelessWidget {
  const WeatherSecondaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var currentWeather = context.read<HomeCubit>().state.currentWeather;

    return SizedBox(
      width: double.infinity,
      child: Row(
        spacing: 12.w,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherSecondaryInfoWidget(
            model: WeatherSecondaryInfoModel(
              imagePath: AppImageAssets.windSpeed,
              title: 'Wind Speed',
              value: '${currentWeather!.wind.speed} km/h',
            ),
          ),
          WeatherSecondaryInfoWidget(
            model: WeatherSecondaryInfoModel(
              imagePath: AppImageAssets.humidity,
              title: 'Humidity',
              value: '${currentWeather.main.humidity}',
            ),
          ),
          WeatherSecondaryInfoWidget(
            model: WeatherSecondaryInfoModel(
              imagePath: AppImageAssets.maxTemp,
              title: 'Max Temp',
              value: '${currentWeather.main.tempMax}°C',
            ),
          ),
        ],
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
