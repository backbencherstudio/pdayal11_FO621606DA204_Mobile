import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pdayal1_mobile/src/feature/screens/home_screen/riverpod/show_today_tasks_provider.dart';
import '../../../../core/routes/route_constant.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../../common_widgets/custom_tes_card_state/custom_test_card_state.dart';
import '../../today_study_task/riverpod/progress_provider.dart';
import '../../today_study_task/widgets/day_left_section.dart';
import '../../today_study_task/widgets/keep_going.dart';
import '../../today_study_task/widgets/linear_progress_indicator.dart';
import '../../today_study_task/widgets/progress_bar.dart';
import '../../today_study_task/widgets/topic_section.dart';
import '../models/chapter_model.dart';

class UpComingTaskCard extends ConsumerWidget {
  const UpComingTaskCard({
    super.key,
    this.textGradient,
    this.chapter,
    this.index,
  });
  final Shader? textGradient;
  final Chapter? chapter;
  final int? index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme;
    final backGradColor = ref.watch(randomBackgroundColor(index ?? 0));
    final borderGradColor = ref.watch(randomBorderColor(index ?? 0));

    return Container(
      padding: EdgeInsets.only(top: 5.r),
      width: 365.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: borderGradColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: InkWell(
        onTap: () {
          ref.read(selectedChapterId.notifier).state = chapter!.chapterId;
          context.push(RouteConst.todayStudyTasksScreen);
        },
        child: Container(
          width: 365.w,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: backGradColor,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Consumer(
                builder: (context,ref,_) {
                  final progress =
                      ref.watch(progressProvider(chapter!.chapterId).notifier).state;
                  final dayLeftText = (progress == 1.0) ? "Completed" : chapter!.daysLeft.toString();
                  return DayLeftSection(
                    style: style,
                    title: chapter!.title,
                    date: chapter!.date,
                    dayLeft: dayLeftText,
                    index: index,
                  );
                }
              ),
              Divider(
                height: 1.h,
                color: AppColor.secondaryTextColor.withValues(alpha: 0.4),
              ),
              SizedBox(height: 24.h),
              // Pass gradient colors to TopicSection
              TopicSection(
                style: style,
                textGradient: textGradient,
                topicBtn: chapter!.topics,
                topicsCount: chapter!.topicsCount.toString(),
                backGradColor: backGradColor, // Pass the backGradColor
                borderGradColor: borderGradColor, // Pass the borderGradColor
              ),
              SizedBox(height: 12.h),
              Divider(
                height: 1.h,
                color: AppColor.secondaryTextColor.withValues(alpha: 0.4),
              ),
              SizedBox(height: 24.h),
              Consumer(
                builder: (_, ref, _) {
                  final progress =
                      ref.watch(progressProvider(chapter!.chapterId).notifier).state;
                  return ProgressBar(style: style, progress: progress);
                },
              ),
              Consumer(
                builder: (context, ref, _) {
                  return GradientProgressBar(
                    progress: ref.watch(progressProvider(chapter!.chapterId).notifier).state,
                    borderRadius: 10.r,
                    colors: borderGradColor,
                  );
                },
              ),
              SizedBox(height: 8.h),
              KeepGoing(style: style, chapter: chapter),
            ],
          ),
        ),
      ),
    );
  }
}

