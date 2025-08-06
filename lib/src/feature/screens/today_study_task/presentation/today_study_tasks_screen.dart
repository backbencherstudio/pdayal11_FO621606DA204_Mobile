import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/core/theme/theme_extension/color_pallete.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/riverpod/progress_provider.dart';
import '../riverpod/pending_task_provider.dart';
import '../widgets/add_new_task_container.dart';
import '../widgets/completed_task_container.dart';
import '../widgets/day_left_section.dart';
import '../widgets/keep_going.dart';
import '../widgets/linear_progress_indicator.dart';
import '../widgets/pending_task_container.dart';
import '../widgets/progress_bar.dart';
import '../widgets/study_resource_section.dart';
import '../widgets/topic_section.dart';

class TodayStudyTasksScreen extends StatefulWidget {
  const TodayStudyTasksScreen({super.key, this.textGradient});

  final Shader? textGradient;

  @override
  State<TodayStudyTasksScreen> createState() => _TodayStudyTasksScreenState();
}

class _TodayStudyTasksScreenState extends State<TodayStudyTasksScreen> {
  TextEditingController addTaskDateTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Today's Study Tasks",
                style: style.titleMedium?.copyWith(
                  color: AppColor.blackText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 365.w,
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          children: [
                            DayLeftSection(style: style),
                            Divider(
                              height: 1.h,
                              color: AppColor.secondaryTextColor.withValues(
                                alpha: 0.4,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            TopicSection(
                              style: style,
                              textGradient: widget.textGradient,
                            ),
                            SizedBox(height: 12.h),
                            Divider(
                              height: 1.h,
                              color: AppColor.secondaryTextColor.withValues(
                                alpha: 0.4,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            ProgressBar(style: style),
                            Consumer(
                              builder: (context, ref, _) {
                                final progress =
                                    ref.watch(progressProvider.notifier).state;
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GradientProgressBar(
                                      progress: progress,
                                      borderRadius: 10,
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(height: 8.h),
                            KeepGoing(style: style),
                            SizedBox(height: 24.h),
                            AddNewTask(
                              style: style,
                              addTaskDateTEController: addTaskDateTEController,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Consumer(
                        builder: (context, ref, _) {
                          final chapterList = ref.watch(
                            pendingTaskListProvider,
                          );
                          return Text(
                            'Pending Tasks (${chapterList.length})',
                            style: style.titleMedium?.copyWith(
                              color: AppColor.blackText,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 16.h),
                      PendingTaskContainer(style: style),
                      SizedBox(height: 20.h),
                      Text(
                        'Completed Tasks (0)',
                        style: style.titleMedium?.copyWith(
                          color: AppColor.blackText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CompletedTaskContainer(style: style, widget: widget),
                      SizedBox(height: 20.h),
                      StudyResourceSection(style: style),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
