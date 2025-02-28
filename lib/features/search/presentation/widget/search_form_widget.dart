import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/features/search/logic/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFormWidget extends StatelessWidget {
  const SearchFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SearchCubit>().formKey,
      child: SizedBox(
        height: 50.h,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: context.read<SearchCubit>().searchController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  context.read<SearchCubit>().searchWithCityName();
                },
                decoration: const InputDecoration(
                  hintText: 'Search',
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.read<SearchCubit>().searchWithCityName();
              },
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
      ),
    );
  }
}
