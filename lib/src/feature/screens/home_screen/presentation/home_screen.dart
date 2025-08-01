import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/core/theme/theme_extension/color_pallete.dart';

import '../../../common_widgets/common_widgets.dart';
import '../widgets/profile_section.dart';

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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'TestReady',
                        style: style.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          foreground: Paint()..shader = textGradient,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        textAlign: TextAlign.center,
                        "Your intelligent study companion for test success",
                        style: style.bodyMedium?.copyWith(
                          color: AppColor.profileTextColor,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      CommonWidgets.primaryButton(
                        title: 'Add New Test',
                        onTap: () {},
                        isIconOn: true, radius: 30, width: 315.w,
                      )
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
