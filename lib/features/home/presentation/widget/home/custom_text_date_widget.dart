import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:climax/features/home/logic/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextDateWidget extends StatelessWidget {
  const CustomTextDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      context.read<HomeCubit>().currentDate,
    );
  }
}

class LocationTextWidget extends StatelessWidget {
  const LocationTextWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      context.read<HomeCubit>().state.currentWeather?.name ?? 'Loading....',
      style: getBoldStyle(
        fontSize: 36.sp,
        color: context.defaultTextColor,
      ),
    );
  }
}
