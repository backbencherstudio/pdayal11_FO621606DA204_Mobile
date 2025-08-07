import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/widgets/secondary_button.dart';

import '../../../../core/constant/icons.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';

class TopicSection extends StatelessWidget {
  const TopicSection({
    super.key,
    required this.style,
    required this.textGradient,
    required this.topicBtn,
    required this.topicsCount,
  });

  final TextTheme style;
  final Shader? textGradient;
  final String topicBtn;
  final String topicsCount;

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
               "Topics ($topicsCount)",
                style: style.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackText,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SecondaryButton(
            style: style,
            textGradient: textGradient,
            topicBtn: topicBtn,
          ),
        ),
      ],
    );
  }
}
