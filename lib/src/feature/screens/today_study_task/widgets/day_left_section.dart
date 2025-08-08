import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/icons.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../../common_widgets/common_widgets.dart';
import '../../home_screen/riverpod/select_date_provider.dart';
import '../../home_screen/riverpod/show_today_tasks_provider.dart';

class DayLeftSection extends StatelessWidget {
  const DayLeftSection({super.key, required this.style});

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,_) {
        final title = ref.watch(chapterListProvider);
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'English Exam',
                textAlign: TextAlign.start,
                style: style.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColor.blackText,
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.calender,
                        height: 14.h,
                        width: 14.w,
                      ),
                      SizedBox(width: 6.w),
                      Consumer(
                        builder: (context,ref,_) {
                          final date = ref.watch(selectedDateProvider);
                          return Text(
                            date,
                            style: style.bodySmall?.copyWith(
                              color: AppColor.secondaryTextColor,
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CommonWidgets.primaryButton(
                    title: '20 days left',
                    radius: 16.r,
                    onTap: () {},
                    isIconOn: false,
                    width: 94,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    textStyle: style.bodySmall?.copyWith(
                      color: AppColor.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
          ],
        );
      }
    );
  }
}
