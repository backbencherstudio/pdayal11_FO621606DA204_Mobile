import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdayal1_mobile/src/core/constant/images.dart';
import 'package:pdayal1_mobile/src/feature/screens/home_screen/riverpod/show_today_tasks_provider.dart';

import '../../../../core/constant/icons.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../home_screen/models/chapter_model.dart';
import '../riverpod/progress_provider.dart';

class KeepGoing extends StatelessWidget {
  const KeepGoing({super.key, required this.style, this.chapter});

  final TextTheme style;
  final Chapter? chapter;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final selectedChapterIndex = ref.watch(selectedChapterId);
        final isCompleted = ref.watch(progressProvider((chapter == null) ? (selectedChapterIndex) : (chapter!.chapterId)).notifier).state == 1;
        final leftText = isCompleted ? 'All Done' : 'Keep Going!';
        final rightText = isCompleted ? 'Excellent!' : 'Needs Attention';
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (isCompleted)
                  Image.asset(AppImages.party, width: 14.w, height: 14.h)
                else
                  SvgPicture.asset(AppIcons.strong, width: 14.w, height: 14.h),
                SizedBox(width: 8.w),
                Text(
                  leftText,
                  style: style.bodySmall?.copyWith(
                    color: AppColor.profileTextColor,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                SvgPicture.asset(AppIcons.fire, width: 14.w, height: 14.h),
                SizedBox(width: 6.w),
                Text(
                  rightText,
                  style: style.bodySmall?.copyWith(
                    color: AppColor.profileTextColor,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
