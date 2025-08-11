import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/feature/screens/home_screen/riverpod/show_today_tasks_provider.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/widgets/task_card.dart';

import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../models/add_task_model.dart';
import '../riverpod/pending_task_provider.dart';

class PendingTaskContainer extends StatelessWidget {
  const PendingTaskContainer({super.key, required this.style});

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Consumer(
          builder: (context, ref, _) {
            final chapterId = ref.watch(selectedChapterId);
            final taskID = ref.watch(selectedTaskId(ref.watch(selectedChapterId)));
            final pendingTaskList = ref.watch(pendingTaskListProvider);

            final filteredTasks = pendingTaskList.where((task) => task.chapterId == chapterId).toList();

            return Column(
              children: [
                ...List.generate(filteredTasks.length ?? 1, (index) {
                  final item = filteredTasks[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: TaskCard(
                      taskId: taskID,
                      style: style,
                      pendingTaskTitle: item.title,
                      date: item.date,
                      difficulty: item.difficulty,
                    ),
                  );
                }),
              ],
            );
          },
        ),
      ),
    );
  }
}
