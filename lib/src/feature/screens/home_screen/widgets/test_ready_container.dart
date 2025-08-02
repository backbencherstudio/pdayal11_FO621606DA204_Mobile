import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../../common_widgets/common_widgets.dart';
import 'add_new_test_dialog.dart';

class TestReadyContainer extends StatelessWidget {
  const TestReadyContainer({
    super.key,
    required this.style,
    required this.textGradient,
  });

  final TextTheme style;
  final Shader textGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
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
              "Your intelligent study companion\nfor test success",
              style: style.bodyMedium?.copyWith(
                color: AppColor.profileTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 24.h),
            CommonWidgets.primaryButton(
              title: 'Add New Test',
              onTap: () {
                onTapAddNewTest(context);
              },
              isIconOn: true,
              radius: 30,
              width: 315.w,
            ),
          ],
        ),
      ),
    );
  }
}
