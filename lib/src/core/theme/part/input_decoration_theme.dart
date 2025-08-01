import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme_extension/color_pallete.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 14.h),
    filled: true,
    fillColor: Color(0xFFFFFFFF),
    hintStyle: GoogleFonts.inter(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.secondaryTextColor,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(99.r),
      borderSide: BorderSide(color: AppColor.borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(99.r),
      borderSide: BorderSide(color: AppColor.primaryColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(99.r),
      borderSide: BorderSide(color: Colors.red),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(99.r),
      borderSide: BorderSide(color: AppColor.borderColor),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme();
}
