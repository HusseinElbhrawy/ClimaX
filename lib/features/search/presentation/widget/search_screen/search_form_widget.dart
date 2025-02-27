import 'package:climax/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFormWidget extends StatelessWidget {
  const SearchFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              width: 40.w,
              height: 50.h,
              margin: EdgeInsetsDirectional.only(start: 12.w),
              decoration: BoxDecoration(
                color: context.primaryColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.location_on_outlined,
                color: context.defaultTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
