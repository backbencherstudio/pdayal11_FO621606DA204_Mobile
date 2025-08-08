import 'package:flutter/material.dart';

import '../../../../core/theme/theme_extension/color_pallete.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.style, required this.title});

  final TextTheme style;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style.bodyLarge?.copyWith(
        color: AppColor.blackText,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
