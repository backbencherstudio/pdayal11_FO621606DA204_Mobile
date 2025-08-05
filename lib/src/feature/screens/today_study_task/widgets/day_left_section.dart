import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/icons.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../../common_widgets/common_widgets.dart';

class DayLeftSection extends StatelessWidget {
  const DayLeftSection({super.key, required this.style});

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'English Exam',
          style: style.titleSmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColor.blackText,
          ),
        ),
        SizedBox(height: 6.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.calender,
                    height: 14.h,
                    width: 14.w,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    "Aug 21, 2025",
                    style: style.bodySmall?.copyWith(
                      color: AppColor.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CommonWidgets.primaryButton(
                title: '20 days left',
                radius: 16.r,
                onTap: () {},
                isIconOn: false,
                width: 94,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                textStyle: style.bodySmall?.copyWith(
                  color: AppColor.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
