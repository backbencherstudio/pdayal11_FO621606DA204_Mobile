import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdayal1_mobile/src/core/constant/icons.dart';
import 'package:pdayal1_mobile/src/core/theme/theme_extension/color_pallete.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final double? borderRadius;
  final void Function()? onTap;
  final bool isIconOn;
  const PrimaryButton({
    super.key,
    this.borderRadius,
    required this.title,
    required this.onTap,
    required this.isIconOn,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 30.r),
          gradient: LinearGradient(
            colors: [AppColor.skyBluColor, AppColor.rustedGreen],
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isIconOn == true) ...[
              SvgPicture.asset(AppIcons.plus),
              SizedBox(width: 10.w),
            ],

            Text(
              title,
              style: style.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColor.screenBackgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
