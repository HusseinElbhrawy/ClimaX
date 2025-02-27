import 'package:climax/config/routes/app_routes.dart';
import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () => context.navigateTo(
                Routes.searchResultDetailsRoute,
              ),
              leading: CircleAvatar(
                radius: 16.r,
                child: Icon(
                  Icons.location_city,
                  size: 16.sp,
                ),
              ),
              title: Text(
                'Search Result',
                style: getRegularStyle(
                  color: context.defaultTextColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
