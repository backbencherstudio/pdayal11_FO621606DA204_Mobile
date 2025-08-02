import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme_extension/color_pallete.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144.w,
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff3866D8), Color(0xff04971F)],
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Container(
        width: 144.w,
        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 13.h),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child:  Text(textAlign: TextAlign.center,'Cancel'),
      ),
    );
  }
}
