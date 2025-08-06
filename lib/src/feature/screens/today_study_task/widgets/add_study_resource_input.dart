import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme_extension/color_pallete.dart';

class AddStudyResourceInput extends StatefulWidget {
  const AddStudyResourceInput({
    super.key,
    required this.style,
    required this.title,
    required this.hintText, this.controller,
  });

  final TextTheme style;
  final String title;
  final String hintText;
  final TextEditingController? controller;

  @override
  State<AddStudyResourceInput> createState() => _AddStudyResourceInputState();
}

class _AddStudyResourceInputState extends State<AddStudyResourceInput> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: widget.style.bodyLarge?.copyWith(
            color: AppColor.profileTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.h),
        TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(hintText: widget.hintText)),
      ],
    );
  }
}
