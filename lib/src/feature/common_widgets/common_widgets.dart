import 'package:flutter/material.dart';
import 'package:pdayal1_mobile/src/feature/common_widgets/primary_button/primary_button.dart';

class CommonWidgets {
  static Widget primaryButton({
    required String title,
    required double? radius,
    required void Function() onTap,
    required bool isIconOn,
    required double? width,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
  }) {
    return PrimaryButton(
      title: title,
      onTap: onTap,
      borderRadius: radius,
      isIconOn: isIconOn,
      width: width,
      textStyle: textStyle,
      padding: padding,
    );
  }

  static Shader textGradient() {
    return LinearGradient(
      colors: [const Color(0xFF3866D8), const Color(0xFF04971F)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 50.0));
  }
}
