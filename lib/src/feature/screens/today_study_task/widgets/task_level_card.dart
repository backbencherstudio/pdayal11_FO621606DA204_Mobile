import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';

class TaskLevelCard extends StatelessWidget {
  const TaskLevelCard({
    super.key,
    required this.style,
    this.color,
    this.title,
    this.textColor,
    this.border, this.onTap,
  });

  final TextTheme style;
  final Color? color;
  final String? title;
  final Color? textColor;
  final Border? border;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.r),
          border: border,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title!,
              style: style.bodyLarge?.copyWith(
                color: textColor ?? AppColor.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
