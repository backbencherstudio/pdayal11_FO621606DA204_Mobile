import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/riverpod/pending_task_provider.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../../common_widgets/common_widgets.dart';
import '../../today_study_task/models/add_task_model.dart';
import '../../today_study_task/riverpod/completed_task_list_provider.dart';

class ChapterCard extends StatelessWidget {
  final TextTheme style;
  final String chapterTitle;
  final String date;
  final String? pendingTaskTitle;

  const ChapterCard({
    super.key,
    required this.style,
    required this.chapterTitle,
    required this.date, this.pendingTaskTitle,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      width: 335.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  chapterTitle,
                  style: style.titleSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColor.dark,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 1,
                child: CommonWidgets.primaryButton(
                  title: date,
                  onTap: () {
                    debugPrint(date);
                  },
                  isIconOn: false,
                  width: 65.w,
                  radius: 16.r,
                  textStyle: style.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColor.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              SvgPicture.asset(AppIcons.customBook, width: 16.w, height: 16.h),
              SizedBox(width: 6.w),
              Text(
                'Custom',
                style: style.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackText,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(color: AppColor.secondaryTextColor.withAlpha(80)),
          SizedBox(height: 16.h),
          Consumer(
            builder: (context,ref,_) {
              final isCompleted = ref.watch(pendingTaskListProvider);
              return CommonWidgets.primaryButton(
                title: 'Mark as Complete',
                radius: 8.r,
                onTap: () {
                  ref
                      .read(completedTaskListProvider.notifier)
                      .add(
                    TaskModel(
                      title: pendingTaskTitle!,
                      date: date,
                      difficulty: 'Easy',
                    ),
                  );
                  ref
                      .read(pendingTaskListProvider.notifier)
                      .remove(
                    TaskModel(
                      title: pendingTaskTitle!,
                      date: date,
                      difficulty: 'Easy',
                    ),
                  );
                },
                isIconOn: false,
                width: 303.w,
                textStyle: style.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColor.white,
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
