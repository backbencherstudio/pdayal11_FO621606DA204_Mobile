import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../../common_widgets/custom_tes_card_state/custom_test_card_state.dart';

class DayLeftSection extends StatelessWidget {
  const DayLeftSection({
    super.key,
    required this.style,
    required this.title,
    required this.date,
    required this.dayLeft,
    this.index,
    this.completedTask,
    this.pendingTask,
  });

  final TextTheme style;
  final String title;
  final String date;
  final String dayLeft;
  final int? index;
  final List<Widget>? completedTask;
  final List<Widget>? pendingTask;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: style.titleSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColor.blackText,
            ),
          ),
        ),
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
                    builder: (_, ref, _) {
                      // final date = ref.watch(selectedDateProvider);
                      return Text(
                        date,
                        style: style.bodySmall?.copyWith(
                          color: AppColor.secondaryTextColor,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Consumer(
              builder: (_, ref, _) {
                final borderGradColor = ref.watch(
                  randomBorderColor(index ?? 0),
                );
                return Flexible(
                  // child: CommonWidgets.primaryButton(
                  //   title: '$dayLeft days left',
                  //   radius: 16.r,
                  //   onTap: () {},
                  //   isIconOn: false,
                  //   width: 94.w,
                  //   textStyle: style.bodySmall?.copyWith(
                  //     color: AppColor.white,
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 4.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      gradient: LinearGradient(
                        colors: borderGradColor,
                        begin: Alignment.centerLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Text(
                      '$dayLeft days left',
                      style: style.bodySmall!.copyWith(
                        color: AppColor.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
