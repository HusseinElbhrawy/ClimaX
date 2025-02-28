import 'package:climax/core/utils/media_query_values.dart';
import 'package:climax/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class SearchSearchScreenSubTitleWidget extends StatelessWidget {
  const SearchSearchScreenSubTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Find The area or city that you want to know the detailed weather info at this time',
      style: getRegularStyle(
        color: context.defaultTextColor,
      ),
    );
  }
}
