import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/widgets/task_level_card.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.style,
    required this.pendingTaskTitle,
    required this.date,
    required this.difficulty,
    required this.taskId,
    required this.chapterId,
  });

  final TextTheme style;
  final String pendingTaskTitle;
  final String date;
  final String difficulty;
  final String taskId;
  final String chapterId;

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
                  pendingTaskTitle,
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

            // Easy
            TaskLevelCard(
              style: style,
              title: "Easy",
              color: AppColor.deepGreen,
              taskId: taskId,
              chapterId: chapterId,
            ),
            SizedBox(height: 12.h),

            // Medium
            TaskLevelCard(
              style: style,
              title: "Medium",
              color: AppColor.deepYellow,
              taskId: taskId,
              chapterId: chapterId,
            ),
            SizedBox(height: 12.h),

            // Hard
            TaskLevelCard(
              style: style,
              title: "Hard",
              color: AppColor.deepRed,
              taskId: taskId,
              chapterId: chapterId,
            ),
            SizedBox(height: 12.h),

            // Cancel
            TaskLevelCard(
              style: style,
              title: "Cancel",
              color: Colors.transparent,
              textColor: AppColor.chayan,
              border: Border.all(color: AppColor.chayan),
              taskId: taskId,
              chapterId: chapterId,
            ),
          ],
        ),
      ),
    );
  }
}
