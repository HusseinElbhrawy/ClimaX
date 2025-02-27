import 'package:climax/core/utils/app_colors.dart';
import 'package:climax/core/utils/constant.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/widgets/custom_leading_back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/search_screen/custom_search_screen_title_widget.dart';
import '../../widget/search_screen/search_form_widget.dart';
import '../../widget/search_screen/search_results_widget.dart';
import '../../widget/search_screen/search_search_screen_sub_title_widget.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstant.defaultPaddingValue.w,
        ),
        child: Column(
          spacing: 12.h,
          children: [
            const CustomSearchScreenTitleWidget(),
            const SearchSearchScreenSubTitleWidget(),
            const SearchFormWidget(),
            const SearchResultsWidget(),
          ],
        ),
      ),
    );
  }
}
