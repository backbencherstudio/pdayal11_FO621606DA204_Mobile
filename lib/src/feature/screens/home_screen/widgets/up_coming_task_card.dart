import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pdayal1_mobile/src/feature/screens/home_screen/riverpod/show_today_tasks_provider.dart';
import '../../../../core/routes/route_constant.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../today_study_task/riverpod/progress_provider.dart';
import '../../today_study_task/widgets/day_left_section.dart';
import '../../today_study_task/widgets/keep_going.dart';
import '../../today_study_task/widgets/linear_progress_indicator.dart';
import '../../today_study_task/widgets/progress_bar.dart';
import '../../today_study_task/widgets/topic_section.dart';
import '../models/chapter_model.dart';

class UpComingTaskCard extends StatefulWidget {
  const UpComingTaskCard({super.key, this.textGradient, this.chapter});
  final Shader? textGradient;
  final Chapter? chapter;

  @override
  State<UpComingTaskCard> createState() => _UpComingTaskCardState();
}

class _UpComingTaskCardState extends State<UpComingTaskCard> {
  TextEditingController addTaskDateTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Stack(
      children: [
        Container(
          width: 365.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.blueSky, AppColor.purpleColor],
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),

        Consumer(
          builder: (context, ref, _) {
            return InkWell(
              onTap: () {
                ref.read(selectedChapterId.notifier).state =
                    widget.chapter!.chapterId;
                context.push(RouteConst.todayStudyTasksScreen);
              },
              child: Container(
                width: 365.w,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    DayLeftSection(
                      style: style,
                      title: widget.chapter!.title,
                      date: widget.chapter!.date,
                      dayLeft: widget.chapter!.daysLeft.toString(),
                    ),
                    Divider(
                      height: 1.h,
                      color: AppColor.secondaryTextColor.withValues(alpha: 0.4),
                    ),
                    SizedBox(height: 24.h),
                    TopicSection(
                      style: style,
                      textGradient: widget.textGradient,
                      topicBtn: widget.chapter!.topics,
                      topicsCount: widget.chapter!.topicsCount.toString(),
                    ),
                    SizedBox(height: 12.h),
                    Divider(
                      height: 1.h,
                      color: AppColor.secondaryTextColor.withValues(alpha: 0.4),
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
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );

    // return Container(
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(colors: [AppColor.blueSky, AppColor.purple]),
    //     borderRadius: BorderRadius.circular(12.r),
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.all(24),
    //     child: GestureDetector(
    //       onTap: () {
    //         context.push(RouteConst.todayStudyTasksScreen);
    //       },
    //       child: Container(
    //         decoration: BoxDecoration(
    //           color: AppColor.white,
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(12.r),
    //             topRight: Radius.circular(12.r),
    //           ),
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.all(16),
    //           child: Text('asfdsaf'),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
