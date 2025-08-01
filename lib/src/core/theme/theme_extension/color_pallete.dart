import 'package:flutter/material.dart';

class AppColor {
  static const Color screenBackgroundColor = Color(0xffF6F8FA);
  static const Color primaryColor = Color(0xFF328B7F);
  static const Color secondaryColor = Color(0xFF1E78F0);
  static const Color error = Color(0xFFEB3D4D);
  static const Color primaryTextColor = Color(0xFF1D1F2C);
  static const Color secondaryTextColor = Color(0xFF777980);
  static const Color profileTextColor = Color(0xff4A4C56);
  static const Color white = Color(0xFFFFFFFF);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFECEFF3);
  static const Color textColor = Color(0xff1D1F2C);
static const Color greyTextColor = Color(0xffA5A5AB);

  static const Color borderColor = Color(0xffE9EAEC);
  static const Color dividerColor = Color(0xffE9EAEC);


  // ColorScheme for light theme
  static ColorScheme lightColorScheme = ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
    surface: surfaceColor,
    error: error,
    onPrimary: white,
    onSecondary: white,
    onSurface: primaryTextColor,
    onError: white,
    brightness: Brightness.light,
  );
}
