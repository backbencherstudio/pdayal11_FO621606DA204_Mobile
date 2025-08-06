import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/riverpod/study_resource_provider.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/widgets/resource_card_container.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../../common_widgets/common_widgets.dart';
import 'add_study_resource_input.dart';

class StudyResourceSection extends StatefulWidget {
  const StudyResourceSection({super.key, required this.style});

  final TextTheme style;

  @override
  State<StudyResourceSection> createState() => _StudyResourceSectionState();
}

class _StudyResourceSectionState extends State<StudyResourceSection> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _urlOrNoteController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Study Resources',
                style: widget.style.titleSmall?.copyWith(
                  color: AppColor.blackText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24.h),
              AddStudyResourceInput(
                style: widget.style,
                title: "Title",
                hintText: 'Enter your Test Name',
                controller: _titleController,
              ),
              SizedBox(height: 24.h),
              AddStudyResourceInput(
                style: widget.style,
                title: "URL or Note",
                hintText: 'Enter your URL or Note',
                controller: _urlOrNoteController,
              ),
              SizedBox(height: 24.h),
              Center(
                child: Consumer(
                  builder: (context, ref, _) {
                    return CommonWidgets.primaryButton(
                      title: 'Add Resources',
                      radius: 8.r,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          final title = _titleController.text.trim();
                          final urlOrNote = _urlOrNoteController.text.trim();

                          ref
                              .read(resourceListProvider.notifier)
                              .add(Chapter(title: title, urlOrNote: urlOrNote));
                          ref.read(showResourceCard.notifier).state = 1;

                          _titleController.clear();
                          _urlOrNoteController.clear();
                        }
                      },
                      isIconOn: true,
                      width: 303.w,
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),
              ResourceCardContainer(style: widget.style),
            ],
          ),
        ),
      ),
    );
  }
}
