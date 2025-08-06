import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../../common_widgets/common_widgets.dart';
import '../riverpod/pending_task_provider.dart';
import 'add_task_date_picker.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({
    Key? key,
    required this.style,
    required this.addTaskDateTEController,
  }) : super(key: key);

  final TextTheme style;
  final TextEditingController addTaskDateTEController;

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final TextEditingController titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.softSkyBlue,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add New Task',
                style: widget.style.bodyLarge?.copyWith(
                  color: AppColor.blackText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: titleController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Task title is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter task title',
                        fillColor: AppColor.white,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 15.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: AddTaskDatePicker(
                      dateController: widget.addTaskDateTEController,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              Consumer(
                builder: (context, ref, _) => CommonWidgets.primaryButton(
                  title: 'Add Test',
                  radius: 30.r,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      final title = titleController.text.trim();
                      final date = widget.addTaskDateTEController.text.trim();

                      ref.read(pendingTaskListProvider.notifier).add(
                        Chapter(title: title, date: date),
                      );
                      ref.read(showPendingTasks.notifier).state = 1;
                      titleController.clear();
                      widget.addTaskDateTEController.clear();
                    }
                  },
                  isIconOn: true,
                  width: 271.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
