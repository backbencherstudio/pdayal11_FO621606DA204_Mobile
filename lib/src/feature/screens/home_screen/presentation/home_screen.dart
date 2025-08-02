import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/core/constant/images.dart';
import 'package:pdayal1_mobile/src/core/theme/theme_extension/color_pallete.dart';
import '../../../common_widgets/common_widgets.dart';
import '../widgets/profile_section.dart';
import '../widgets/task_container.dart';
import '../widgets/test_ready_container.dart';

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
                  child: Column(
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
                      ),
                    ],
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
