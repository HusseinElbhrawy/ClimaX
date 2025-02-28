import 'package:climax/core/api/end_point.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:climax/features/home/presentation/widget/home/main_weather_info_widget.dart';
import 'package:climax/features/home/presentation/widget/home/weather_secondary_widget.dart';
import 'package:climax/features/search/logic/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultLoadedWidget extends StatelessWidget {
  const SearchResultLoadedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12.h,
      children: [
        Text(
          context.read<SearchCubit>().state.searchResult?.name ?? 'Loading....',
          style: getBoldStyle(
            fontSize: 36.sp,
            color: context.defaultTextColor,
          ),
        ),
        32.verticalSpace,
        MainWeatherInfoWidget(
          imagePath:
              "${EndPoint.baseImageURL}/${searchCubit.state.searchResult!.weather.first.icon.trim()}@4x.png",
          status: searchCubit.state.searchResult!.weather.first.main,
          temp: searchCubit.state.searchResult!.main.temp.toStringAsFixed(1),
        ),
        WeatherSecondaryWidget(
          humidity: searchCubit.state.searchResult!.main.humidity.toString(),
          maxTemp: searchCubit.state.searchResult!.main.tempMax.toString(),
          windSpeed: searchCubit.state.searchResult!.wind.speed.toString(),
        ),
      ],
    );
  }
}
