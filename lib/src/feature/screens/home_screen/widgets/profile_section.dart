import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/images.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key, required this.style});

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Image.asset(AppImages.profile, width: 43.w, height: 43.h),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to TestReady',
                  style: style.bodySmall?.copyWith(color: AppColor.blackText),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Johnson',
                  style: style.bodyLarge?.copyWith(
                    color: Colors.black.withValues(alpha: 0.80),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
