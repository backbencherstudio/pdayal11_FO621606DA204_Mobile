import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/widgets/task_level_card.dart';

import '../../../../core/theme/theme_extension/color_pallete.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.style,
    required this.chapterTitle,
    required this.date,
  });

  final TextTheme style;
  final String chapterTitle;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.softSkyBlue,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  chapterTitle,
                  style: style.bodyLarge?.copyWith(
                    color: AppColor.blackText,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Text(
                  date,
                  style: style.bodySmall?.copyWith(
                    color: AppColor.profileTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            TaskLevelCard(style: style),
            SizedBox(height: 12.h),
            TaskLevelCard(
              style: style,
              title: 'Medium',
              color: AppColor.deepYellow,
            ),
            SizedBox(height: 12.h),
            TaskLevelCard(style: style, title: 'Hard', color: AppColor.deepRed),
            SizedBox(height: 12.h),
            TaskLevelCard(
              style: style,
              title: 'Cancel',
              color: Colors.transparent,
              textColor: AppColor.chayan,
              border: Border.all(color: AppColor.chayan),
            ),
          ],
        ),
      ),
    );
  }
}
