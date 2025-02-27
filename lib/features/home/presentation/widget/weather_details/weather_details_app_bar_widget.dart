import 'package:climax/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherDetailsAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const WeatherDetailsAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: context.whiteColor,
        ),
        onPressed: () => context.mayPop(),
      ),
      title: Text(
        'Tanta',
        style: TextStyle(
          color: context.whiteColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
