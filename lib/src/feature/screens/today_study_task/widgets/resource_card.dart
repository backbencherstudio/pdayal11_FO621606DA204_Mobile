import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/icons.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';

class ResourceCard extends StatelessWidget {
  const ResourceCard({super.key, required this.style, required this.title, required this.onCancel});

  final TextTheme style;
  final String title;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.softSkyBlue,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppIcons.customBook,
                  width: 16.w,
                  height: 16.w,
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    title,
                    style: style.bodySmall?.copyWith(
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onCancel,  // Trigger the onCancel function
                  child: SvgPicture.asset(AppIcons.cancel, width: 16.w, height: 16.w),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

