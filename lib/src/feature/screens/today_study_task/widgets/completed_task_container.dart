import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../presentation/today_study_tasks_screen.dart';
import 'completed_task_card.dart';

class CompletedTaskContainer extends StatelessWidget {
  const CompletedTaskContainer({
    super.key,
    required this.style,
    required this.widget,
  });

  final TextTheme style;
  final TodayStudyTasksScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            ...List.generate(4, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: CompletedTaskCard(
                  style: style,
                  widget: widget,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}