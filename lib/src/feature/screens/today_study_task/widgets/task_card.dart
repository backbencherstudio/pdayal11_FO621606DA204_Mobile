import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/feature/screens/home_screen/riverpod/chapter_id_provider.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/widgets/task_level_card.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../models/add_task_model.dart';
import '../riverpod/completed_task_list_provider.dart';
import '../riverpod/pending_task_provider.dart';

class TaskCard extends ConsumerWidget {
  const TaskCard({
    super.key,
    required this.style,
    required this.pendingTaskTitle,
    required this.date,
    required this.difficulty,
  });

  final TextTheme style;
  final String pendingTaskTitle;
  final String date;
  final String difficulty;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedChapterId);

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

            TaskLevelCard(
                  style: style,
                  title: 'Easy',
                  color: AppColor.deepGreen,
                  onTap: () {
                    ref
                        .read(completedTaskListProvider.notifier)
                        .add(
                          TaskModel(
                            chapterID: id,
                            title: pendingTaskTitle,
                            date: date,
                            difficulty: 'Easy',
                          ),
                        );
                    ref
                        .read(pendingTaskListProvider.notifier)
                        .remove(
                          TaskModel(
                            chapterID: id,
                            title: pendingTaskTitle,
                            date: date,
                            difficulty: 'Easy',
                          ),
                        );
                  },
                ),
            SizedBox(height: 12.h),

TaskLevelCard(
                  style: style,
                  title: 'Medium',
                  color: AppColor.deepYellow,
                  onTap: () {
                    ref
                        .read(completedTaskListProvider.notifier)
                        .add(
                          TaskModel(
                            chapterID: id,
                            title: pendingTaskTitle,
                            date: date,
                            difficulty: 'Medium',
                          ),
                        );
                    ref
                        .read(pendingTaskListProvider.notifier)
                        .remove(
                          TaskModel(
                            chapterID: id,
                            title: pendingTaskTitle,
                            date: date,
                            difficulty: 'Medium',
                          ),
                        );
                  },
                ),
            SizedBox(height: 12.h),

            TaskLevelCard(
                  style: style,
                  title: 'Hard',
                  color: AppColor.deepRed,
                  onTap: () {
                    ref
                        .read(completedTaskListProvider.notifier)
                        .add(
                          TaskModel(
                            chapterID: id,
                            title: pendingTaskTitle,
                            date: date,
                            difficulty: 'Hard',
                          ),
                        );
                    ref
                        .read(pendingTaskListProvider.notifier)
                        .remove(
                          TaskModel(
                            chapterID: id,
                            title: pendingTaskTitle,
                            date: date,
                            difficulty: 'Hard',
                          ),
                        );
                  },
                ),
            SizedBox(height: 12.h),

TaskLevelCard(
                  style: style,
                  title: 'Cancel',
                  color: Colors.transparent,
                  textColor: AppColor.chayan,
                  border: Border.all(color: AppColor.chayan),
                  onTap: () {
                    ref
                        .read(pendingTaskListProvider.notifier)
                        .remove(
                      TaskModel(
                        chapterID: id,
                        title: pendingTaskTitle,
                        date: date,
                        difficulty: 'Hard',
                      ),
                    );
                  },
                ),
    ],
        ),
    )
    );
  }
}
