import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:pdayal1_mobile/src/core/theme/theme_extension/color_pallete.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      color: AppColor.primaryTextColor,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize: 26.sp,
      fontWeight: FontWeight.w700,
      color: AppColor.primaryTextColor,
    ),
    headlineSmall: GoogleFonts.inter(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: AppColor.primaryTextColor,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      color: AppColor.primaryTextColor,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColor.primaryTextColor,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.primaryTextColor,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.primaryTextColor,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.primaryTextColor,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.primaryTextColor,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColor.secondaryTextColor,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColor.secondaryTextColor,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 11.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.secondaryTextColor,
    ),
  );
}
