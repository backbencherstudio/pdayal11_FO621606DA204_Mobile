import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key,
    required this.style, required this.progress
  }
      );

  final TextTheme style;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              SvgPicture.asset(AppIcons.progress, width: 14.w, height: 14.h),
              SizedBox(width: 6.w),
              Text(
                "Progress",
                style: style.bodyLarge?.copyWith(
                  color: AppColor.secondaryTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Consumer(
          builder: (context, ref, _) {
            return Expanded(
              child: Text(
                '${(progress * 100).toStringAsFixed(0)}%',
                textAlign: TextAlign.end,
                style: style.bodySmall?.copyWith(
                  color: AppColor.profileTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
