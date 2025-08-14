import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';

class TopicSection extends StatelessWidget {
  const TopicSection({
    super.key,
    required this.style,
    required this.textGradient,
    required this.topicBtn,
    required this.topicsCount,
    required this.backGradColor,
    required this.borderGradColor,
  });

  final TextTheme style;
  final Shader? textGradient;
  final String topicBtn;
  final String topicsCount;
  final List<Color> backGradColor;
  final List<Color> borderGradColor;

  @override
  Widget build(BuildContext context) {
    final List<String> topicList =
        topicBtn
            .split(',')
            .map((topic) => topic.trim())
            .where((topic) => topic.isNotEmpty)
            .toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppIcons.customBook, width: 14.w, height: 14.h),
            SizedBox(width: 6.w),
            Text(
              "Topics ($topicsCount)",
              style: style.bodySmall?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColor.blackText,
              ),
            ),
          ],
        ),
        Spacer(),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  topicList.map((topic) {
                    return Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: backGradColor,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: borderGradColor.last,
                            width: 1,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 4.h,
                        ),
                        child: ShaderMask(
                          shaderCallback:
                              (rect) =>
                                  textGradient ??
                                  LinearGradient(
                                    colors: borderGradColor,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(
                                    Rect.fromLTRB(
                                      0.0,
                                      0.0,
                                      rect.width,
                                      rect.height,
                                    ),
                                  ),
                          child: Text(
                            topic,
                            style: style.bodySmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
