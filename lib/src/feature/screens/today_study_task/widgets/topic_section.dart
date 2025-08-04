import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/icons.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';

class TopicSection extends StatelessWidget {
  const TopicSection({
    super.key,
    required this.style,
    required this.textGradient,
  });

  final TextTheme style;
  final Shader? textGradient;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              SvgPicture.asset(AppIcons.customBook, width: 14.w, height: 14.h),
              SizedBox(width: 6.w),
              Text(
                'Topics (1)',
                style: style.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackText,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              //gradient: LinearGradient(colors: [AppColor.skyBluColor,AppColor.rustedGreen]),
              color: Color(0xff0887CE).withValues(alpha: 0.10),
              border: Border.all(color: AppColor.containerBg1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              child: Text(
                'ABCDEFGHIJKLM',
                style: style.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  foreground: Paint()..shader = textGradient,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
