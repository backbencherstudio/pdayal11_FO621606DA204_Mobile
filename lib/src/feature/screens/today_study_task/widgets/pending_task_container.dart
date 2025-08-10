import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/widgets/task_card.dart';

import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../home_screen/riverpod/chapter_id_provider.dart';
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
            // Get the selected chapterId
            final chapterId = ref.watch(selectedChapterId);

            // Get the tasks for the selected chapter
            final pendingTaskList = ref.watch(pendingTaskListProvider);

            // Filter tasks based on the selected chapterId
            final filteredTasks = pendingTaskList.where((task) => task.chapterID == chapterId).toList();

            return Column(
              children: [
                ...List.generate(filteredTasks.length, (index) {
                  final item = filteredTasks[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: TaskCard(
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
