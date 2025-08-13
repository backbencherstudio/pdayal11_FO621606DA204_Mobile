import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/models/add_task_model.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/riverpod/completed_task_list_provider.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/riverpod/pending_task_provider.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../riverpod/progress_provider.dart';

class TaskLevelCard extends ConsumerWidget {
  const TaskLevelCard({
    super.key,
    required this.style,
    this.color,
    required this.title,
    this.textColor,
    this.border,
    required this.taskId,
    required this.chapterId,
  });

  final TextTheme style;
  final Color? color;
  final String title;
  final Color? textColor;
  final Border? border;
  final String taskId;
  final String chapterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingTaskNotifier = ref.read(pendingTaskListProvider.notifier);
    final completedTaskNotifier = ref.read(completedTaskListProvider.notifier);
    final pendingCountNotifier = ref.read(pendingTaskCount(chapterId).notifier);
    final completedCountNotifier = ref.read(completedTaskCount(chapterId).notifier);

    TaskModel? task;
    try {
      task = pendingTaskNotifier.getTaskById(taskId);
    } catch (_) {
      // Task not found, maybe already removed
      task = null;
    }

    if (task == null) {
      // If task not found in pending, disable button or return empty Container
      return SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () {
        if (title == "Cancel") {
          // Remove from pending without adding to completed
          pendingTaskNotifier.removeById(task!);
          pendingCountNotifier.state--;
        } else {
          // Add to completed with difficulty
          completedTaskNotifier.add(
            TaskModel(
              chapterId: task!.chapterId,
              title: task.title,
              date: task.date,
              difficulty: title,
              taskId: task.taskId,
            ),
          );
          completedCountNotifier.state++;
          pendingTaskNotifier.removeById(task);
          pendingCountNotifier.state--;
        }
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
              title,
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
