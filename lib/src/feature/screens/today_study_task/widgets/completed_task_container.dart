import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../home_screen/riverpod/chapter_id_provider.dart';
import '../presentation/today_study_tasks_screen.dart';
import '../riverpod/completed_task_list_provider.dart';
import 'completed_task_card.dart';

class CompletedTaskContainer extends ConsumerWidget {
  const CompletedTaskContainer({
    super.key,
    required this.style,
    required this.widget,
  });

  final TextTheme style;
  final TodayStudyTasksScreen widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedTasks = ref.watch(completedTaskListProvider);
    final chapterId = ref.watch(selectedChapterId);
    final completedTaskList = ref.watch(
      completedTaskListProvider,
    );
    final filteredCompletedTasks =
    completedTaskList
        .where((task) => task.chapterID == chapterId)
        .toList();

    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: filteredCompletedTasks.map((task) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: CompletedTaskCard(
                style: style,
                widget: widget,
                taskTitle: task.title,
                taskDate: task.date,
                difficulty: task.difficulty,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
