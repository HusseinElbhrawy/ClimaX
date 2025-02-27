import 'package:climax/config/routes/app_routes.dart';
import 'package:climax/config/theme/theme_provider.dart';
import 'package:climax/core/utils/app_colors.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: AppColors.transparent,
      leading: Center(
        child: CircleAvatar(
          radius: 16.r,
          child: Icon(Icons.person_4_outlined, size: 16.sp),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.navigateTo(Routes.searchRoute);
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
        ValueListenableBuilder<ThemeMode>(
          valueListenable: ThemeManager.themeNotifier,
          builder: (BuildContext context, value, Widget? child) {
            return IconButton(
              onPressed: () {
                ThemeManager.toggleTheme();
              },
              icon: Icon(
                value == ThemeMode.dark
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
