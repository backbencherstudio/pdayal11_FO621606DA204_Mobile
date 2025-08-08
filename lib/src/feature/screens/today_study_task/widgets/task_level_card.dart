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
    this.border,
  });

  final TextTheme style;
  final Color? color;
  final String? title;
  final Color? textColor;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color ?? AppColor.deepGreen,
        borderRadius: BorderRadius.circular(8.r),
        border: border,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title ?? 'Easy',
            style: style.bodyLarge?.copyWith(
              color: textColor ?? AppColor.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
