import 'package:climax/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

class CustomLeadingBackButtonWidget extends StatelessWidget {
  const CustomLeadingBackButtonWidget({
    super.key,
    this.color,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: color ?? context.whiteColor,
      ),
      onPressed: () => context.mayPop(),
    );
  }
}
