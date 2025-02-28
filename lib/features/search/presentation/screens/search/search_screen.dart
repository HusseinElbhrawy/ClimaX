import 'package:climax/core/utils/app_colors.dart';
import 'package:climax/core/utils/constant.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/widgets/custom_leading_back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/custom_search_screen_title_widget.dart';
import '../../widget/search_form_widget.dart';
import '../../widget/search_search_screen_sub_title_widget.dart';
import '../search_result/search_result_details_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        leading: CustomLeadingBackButtonWidget(
          color: context.defaultTextColor,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: AppConstant.defaultPaddingValue.w,
        ),
        child: Column(
          spacing: 12.h,
          children: [
            const CustomSearchScreenTitleWidget(),
            const SearchSearchScreenSubTitleWidget(),
            const SearchFormWidget(),
            40.verticalSpace,
            const SearchResultWidget(),
          ],
        ),
      ),
    );
  }
}
