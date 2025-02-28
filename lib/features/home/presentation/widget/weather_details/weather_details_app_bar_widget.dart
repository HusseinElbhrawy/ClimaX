import 'package:climax/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_leading_back_button_widget.dart';
import '../../../logic/home/home_cubit.dart';

class WeatherDetailsAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const WeatherDetailsAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const CustomLeadingBackButtonWidget(),
      title: Text(
        context.read<HomeCubit>().state.currentWeather?.name ?? 'Loading....',
        style: TextStyle(
          color: context.whiteColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
