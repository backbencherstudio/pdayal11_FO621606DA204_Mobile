import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../../common_widgets/common_widgets.dart';
import '../../today_study_task/riverpod/pending_task_provider.dart';
import '../riverpod/chapter_id_provider.dart';
import '../widgets/chapter_card.dart';
import '../widgets/profile_section.dart';
import '../widgets/task_container.dart';
import '../widgets/test_ready_container.dart';
import '../widgets/up_coming_task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final Shader textGradient = CommonWidgets.textGradient();

    return Scaffold(
      backgroundColor: AppColor.homeBg,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileSection(style: style),
            SizedBox(height: 32.h),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Consumer(
                    builder: (context, ref, _) {
                      final selectedContainer = ref.watch(pendingTaskListProvider);
                      final selectedUpcoming = ref.watch(showTodayTasks);

                      final chapterList = ref.watch(chapterListProvider);

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TestReadyContainer(
                            style: style,
                            textGradient: textGradient,
                          ),
                          SizedBox(height: 20.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Today's Study Tasks",
                              style: style.titleMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.blackText,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),

                          // TaskContainer for Today's Study Tasks
                          if (selectedContainer == 0)
                            TaskContainer(
                              picture: Image.asset(
                                AppImages.party,
                                width: 48.w,
                                height: 48.h,
                              ),
                              title: 'All caught up!',
                              titleStyle: style.bodyLarge!.copyWith(
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w500,
                              ),
                              subtitle:
                              'No study tasks for today. Great job\nstaying on track!',
                              subtitleStyle: style.bodyMedium!.copyWith(
                                color: AppColor.profileTextColor,
                              ),
                            )
                          else
                          // Display Chapter Cards
                            ...List.generate(chapterList.length, (index) {
                              final item = chapterList[index];
                              return ChapterCard(
                                style: style,
                                chapterTitle: item.title,
                                date: item.date,
                              );
                            }),

                          SizedBox(height: 22.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Upcoming Tests",
                              style: style.titleMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.blackText,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),

                          // TaskContainer for Upcoming Tests
                          if (selectedUpcoming == 0)
                            TaskContainer(
                              picture: Image.asset(
                                AppImages.booksPng,
                                height: 48.h,
                                width: 48.w,
                              ),
                              title: 'No tests scheduled',
                              titleStyle: style.bodyLarge!.copyWith(
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w500,
                              ),
                              subtitle:
                              'Add your first test to get started with\nsmart study planning!',
                              subtitleStyle: style.bodyMedium!.copyWith(
                                color: AppColor.profileTextColor,
                              ),
                            )
                          else
                          // Display Upcoming Task Cards
                            ...List.generate(chapterList.length, (index) {
                              final item = chapterList[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: UpComingTaskCard(chapter: item, index: index),
                              );
                            }),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
