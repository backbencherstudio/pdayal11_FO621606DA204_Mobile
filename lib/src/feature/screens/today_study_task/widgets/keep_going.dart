import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/icons.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';

class KeepGoing extends StatelessWidget {
  const KeepGoing({super.key, required this.style});

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(AppIcons.strong, width: 14.w, height: 14.h),
            SizedBox(width: 8.w),
            Text(
              'keep going!',
              style: style.bodySmall?.copyWith(
                color: AppColor.profileTextColor,
              ),
            ),
          ],
        ),

        Row(
          children: [
            SvgPicture.asset(AppIcons.fire, width: 14.w, height: 14.h),
            SizedBox(width: 6.w),
            Text(
              'Needs Attention',
              style: style.bodySmall?.copyWith(
                color: AppColor.profileTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
