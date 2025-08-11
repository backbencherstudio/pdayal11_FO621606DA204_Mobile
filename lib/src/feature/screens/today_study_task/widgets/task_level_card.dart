import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/feature/screens/home_screen/riverpod/show_today_tasks_provider.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/models/add_task_model.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/riverpod/completed_task_list_provider.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/riverpod/pending_task_provider.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/riverpod/progress_provider.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';

class TaskLevelCard extends ConsumerWidget {
  const TaskLevelCard({
    super.key,
    required this.style,
    this.color,
    required this.title,
    this.textColor,
    this.border,
  });

  final TextTheme style;
  final Color? color;
  final String title;
  final Color? textColor;
  final Border? border;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapId = ref.watch(selectedChapterId);
    final taskId = ref.watch(selectedTaskId(chapId));
    final task = ref.read(pendingTaskListProvider.notifier).getTaskById(taskId);
    return GestureDetector(
      onTap: (){
          ref.read(completedTaskListProvider.notifier).add(
              TaskModel(chapterId: task.chapterId, title: task.title, date: task.date, difficulty: title, taskId: task.taskId)
          );
          ref.read(completedTaskCount(chapId).notifier).state++;
          ref.read(pendingTaskListProvider.notifier).remove(task);
          ref.read(pendingTaskCount(chapId).notifier).state--;
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.r),
          border: border,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title!,
              style: style.bodyLarge?.copyWith(
                color: textColor ?? AppColor.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
