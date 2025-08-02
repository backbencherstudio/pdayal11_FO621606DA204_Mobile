import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({
    super.key,
    required this.title,
    required this.subtitle,
    this.picture,
    required this.titleStyle,
    required this.subtitleStyle,
  });

  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final String title;
  final String subtitle;
  final Image? picture;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),

      child: Column(
        children: [
          if (picture != null) picture!,
          SizedBox(height: 16.h),
          Text(title, style: titleStyle),
          SizedBox(height: 16.h),
          Text(textAlign: TextAlign.center, subtitle, style: subtitleStyle),
        ],
      ),
    );
  }
}
