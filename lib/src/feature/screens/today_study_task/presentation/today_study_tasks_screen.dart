import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdayal1_mobile/src/core/constant/icons.dart';
import 'package:pdayal1_mobile/src/core/theme/theme_extension/color_pallete.dart';
import '../widgets/day_left_section.dart';
import '../widgets/topic_section.dart';

class TodayStudyTasksScreen extends StatelessWidget {
  const TodayStudyTasksScreen({super.key, this.textGradient});

  final Shader? textGradient;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Today's Study Tasks",
                style: style.titleMedium?.copyWith(
                  color: AppColor.blackText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 335.w,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        DayLeftSection(style: style),
                        Divider(
                          height: 1.h,
                          color: AppColor.secondaryTextColor.withValues(
                            alpha: 0.4,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        TopicSection(style: style, textGradient: textGradient),
                        SizedBox(height: 12.h),
                        Divider(
                          height: 1.h,
                          color: AppColor.secondaryTextColor.withValues(
                            alpha: 0.4,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.progress,
                                    width: 14.w,
                                    height: 14.h,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    "Progress",
                                    style: style.bodyLarge?.copyWith(
                                      color: AppColor.secondaryTextColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              child: Text(
                                '60%',
                                textAlign: TextAlign.end,
                                style: style.bodySmall?.copyWith(
                                  color: AppColor.profileTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
