import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/core/theme/theme_extension/color_pallete.dart';
import 'package:pdayal1_mobile/src/feature/screens/home_screen/riverpod/show_today_tasks_provider.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/riverpod/progress_provider.dart';
import '../../../common_widgets/custom_tes_card_state/custom_test_card_state.dart';
import '../../home_screen/models/chapter_model.dart';
import '../riverpod/completed_task_list_provider.dart';
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
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new_rounded, size: 20.sp),
                  ),
                  SizedBox(width: 60.w),
                  Text(
                    "Today's Study Tasks",
                    style: style.titleMedium?.copyWith(
                      color: AppColor.blackText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
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
                            Consumer(
                              builder: (context, ref, _) {
                                List<Chapter> chapterList = ref.watch(
                                  chapterListProvider,
                                );
                                final chapterId = ref.watch(selectedChapterId);
                                Chapter chapter = chapterList.firstWhere(
                                      (chapters) => chapters.chapterId == chapterId,
                                );
                                final progress =
                                    ref.watch(progressProvider(chapter!.chapterId).notifier).state;
                                final dayLeftText = (progress == 1.0) ? "Completed" : chapter!.daysLeft.toString();

                                return DayLeftSection(
                                  style: style,
                                  title: chapter.title,
                                  date: chapter.date,
                                  dayLeft: dayLeftText,
                                );
                              },
                            ),
                            Divider(
                              height: 1.h,
                              color: AppColor.secondaryTextColor.withValues(
                                alpha: 0.4,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Consumer(
                              builder: (context, ref, _) {
                                List<Chapter> chapterList = ref.watch(
                                  chapterListProvider,
                                );
                                final chapterId = ref.watch(selectedChapterId);
                                Chapter chapter = chapterList.firstWhere(
                                      (chapters) => chapters.chapterId == chapterId,
                                );
                                return TopicSection(
                                  style: style,
                                  textGradient: widget.textGradient,
                                  topicBtn: chapter.topics,
                                  topicsCount: chapter.topicsCount.toString(),
                                  backGradColor: ref.watch(randomBackgroundColor(0)), // Gradient Color for Background
                                  borderGradColor: ref.watch(randomBorderColor(0)), // Gradient Color for Border
                                );
                              },
                            ),
                            SizedBox(height: 12.h),
                            Divider(
                              height: 1.h,
                              color: AppColor.secondaryTextColor.withValues(
                                alpha: 0.4,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Consumer(
                              builder: (_, ref, _) {
                                List<Chapter> chapterList = ref.watch(
                                  chapterListProvider,
                                );
                                final chapterId = ref.watch(selectedChapterId);
                                final chapter = ref
                                    .read(chapterListProvider.notifier)
                                    .getChapterById(chapterId);
                                return ProgressBar(
                                  style: style,
                                  progress:
                                  ref
                                      .watch(
                                    progressProvider(
                                      chapter!.chapterId,
                                    ).notifier,
                                  )
                                      .state,
                                );
                              },
                            ),
                            Consumer(
                              builder: (context, ref, _) {
                                final chapterId = ref.watch(selectedChapterId);
                                final chapter = ref
                                    .read(chapterListProvider.notifier)
                                    .getChapterById(chapterId);

                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GradientProgressBar(
                                      progress:
                                      ref
                                          .watch(
                                        progressProvider(
                                          chapter!.chapterId,
                                        ).notifier,
                                      )
                                          .state,
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
                          final chapterId = ref.watch(selectedChapterId);
                          final filteredTasks =
                          chapterList
                              .where((task) => task.chapterId == chapterId)
                              .toList();
                          return Text(
                            'Pending Tasks (${filteredTasks.length})',
                            style: style.titleMedium?.copyWith(
                              color: AppColor.blackText,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 16.h),
                      PendingTaskContainer(style: style),
                      // SizedBox(height: 20.h),
                      Consumer(
                        builder: (context, ref, _) {
                          final chapterId = ref.watch(selectedChapterId);

                          final completedList = ref
                              .read(completedTaskListProvider.notifier)
                              .getTasksByChapterId(chapterId);
                          final filteredTasks =
                          completedList
                              .where((task) => task.chapterId == chapterId)
                              .toList();

                          final count = ref.watch(completedTaskListProvider);
                          return Text(
                            'Completed Tasks (${filteredTasks.length})',
                            style: style.titleMedium?.copyWith(
                              color: AppColor.blackText,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
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
