import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/models/add_task_model.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/riverpod/completed_task_list_provider.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/riverpod/pending_task_provider.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../../common_widgets/common_widgets.dart';
import '../../today_study_task/riverpod/progress_provider.dart';

class ChapterCard extends ConsumerWidget {
  final TextTheme style;
  final String chapterId;
  final String chapterTitle;
  final String date;

  const ChapterCard({
    super.key,
    required this.style,
    required this.chapterId,
    required this.chapterTitle,
    required this.date,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      width: 335.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  chapterTitle,
                  style: style.titleSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColor.dark,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 1,
                child: CommonWidgets.primaryButton(
                  title: date,
                  onTap: () {
                    debugPrint(date);
                  },
                  isIconOn: false,
                  width: 65.w,
                  radius: 16.r,
                  textStyle: style.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColor.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              SvgPicture.asset(AppIcons.customBook, width: 16.w, height: 16.h),
              SizedBox(width: 6.w),
              Text(
                'Custom',
                style: style.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackText,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(color: AppColor.secondaryTextColor.withAlpha(80)),
          SizedBox(height: 16.h),
      CommonWidgets.primaryButton(
        title: 'Mark as Complete',
        radius: 8.r,
        onTap: () {
          final pendingNotifier = ref.read(pendingTaskListProvider.notifier);
          final completedNotifier = ref.read(completedTaskListProvider.notifier);
          final pendingCountNotifier = ref.read(pendingTaskCount(chapterId).notifier);
          final completedCountNotifier = ref.read(completedTaskCount(chapterId).notifier);

          // Get the specific task for this chapter and date
          final taskToComplete = ref.read(pendingTaskListProvider).firstWhere(
                (task) => task.chapterId == chapterId && task.date == date,
            orElse: () => throw Exception('Task not found'),
          );

          // Remove the task from pending tasks
          pendingNotifier.removeById(taskToComplete);
          pendingCountNotifier.state =
          (pendingCountNotifier.state > 0) ? pendingCountNotifier.state - 1 : 0;

          // Add the task to completed tasks
          completedNotifier.add(TaskModel(
            chapterId: taskToComplete.chapterId,
            title: taskToComplete.title,
            date: taskToComplete.date,
            difficulty: "Easy",
            taskId: taskToComplete.taskId,
          ));
          completedCountNotifier.state++;
        },

        isIconOn: false,
        width: 303.w,
        textStyle: style.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColor.white,
        ),
      ),

      ],
      ),
    );
  }
}
