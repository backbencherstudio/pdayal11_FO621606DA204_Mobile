import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme_extension/color_pallete.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.style,
    required this.textGradient,
    this.titleText,
     this.topicBtn,
  });

  final TextTheme style;
  final Shader? textGradient;
  final String? titleText;
  final String? topicBtn;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.containerBg1.withValues(alpha: 0.10),
        border: Border.all(color: AppColor.containerBg1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        child: Center(
          child: Text(
            topicBtn ?? titleText!,
            style: style.bodySmall?.copyWith(
              fontWeight: FontWeight.w400,
              foreground: Paint()..shader = textGradient,
            ),
          ),
        ),
      ),
    );
  }
}
