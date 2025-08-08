import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/widgets/secondary_button.dart';

import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../presentation/today_study_tasks_screen.dart';

class CompletedTaskCard extends StatelessWidget {
  const CompletedTaskCard({
    super.key,
    required this.style,
    required this.widget,
    required this.taskTitle,
    required this.taskDate,
    required this.difficulty,
  });

  final TextTheme style;
  final TodayStudyTasksScreen widget;
  final String taskTitle;
  final String taskDate;
  final String difficulty;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  taskTitle,
                  style: style.bodyLarge?.copyWith(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  taskDate,
                  style: style.bodyMedium?.copyWith(
                    color: AppColor.profileTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: 160.w,
              child: SecondaryButton(
                titleText: 'Difficulty: $difficulty',
                style: style,
                textGradient: widget.textGradient,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
