import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pdayal1_mobile/src/core/constant/images.dart';
import 'package:pdayal1_mobile/src/core/theme/theme_extension/color_pallete.dart';
import 'package:pdayal1_mobile/src/feature/screens/home_screen/riverpod/show_today_tasks_provider.dart';
import '../../../../core/routes/route_constant.dart';
import '../../../common_widgets/common_widgets.dart';
import '../../today_study_task/riverpod/pending_task_provider.dart';
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
                      final selectedContainer = ref.watch(showPendingTasks);
                      final selectedUpcoming = ref.watch(showTodayTasks);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TestReadyContainer(
                            style: style,
                            textGradient: textGradient,
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Today's Study Tasks",
                            style: style.titleMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.blackText,
                            ),
                          ),
                          SizedBox(height: 16.h),

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
                            Consumer(
                              builder: (context, ref, _) {
                                final chapterList = ref.watch(
                                  pendingTaskListProvider,
                                );
                                return Column(
                                  children: [
                                    ...List.generate(chapterList.length, (
                                      index,
                                    ) {
                                      final item = chapterList[index];
                                      return ChapterCard(
                                        style: style,
                                        chapterTitle: item.title,
                                        date: item.date,
                                      );
                                    }),
                                  ],
                                );
                              },
                            ),

                          SizedBox(height: 22.h),
                          Text(
                            "Upcoming Tests",
                            style: style.titleMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.blackText,
                            ),
                          ),
                          SizedBox(height: 16.h),

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
                            Consumer(
                              builder: (context, ref, _) {
                                final chapterList = ref.watch(
                                  chapterListProvider,
                                );
                                return Column(
                                  children: [
                                    ...List.generate(chapterList.length, (
                                        index,
                                        ) {
                                      final item = chapterList[index];
                                      return  Padding(
                                        padding:  EdgeInsets.only(bottom: 10.h),
                                        child: UpComingTaskCard(),
                                      );
                                    }),
                                  ],
                                );
                              },
                            ),

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


