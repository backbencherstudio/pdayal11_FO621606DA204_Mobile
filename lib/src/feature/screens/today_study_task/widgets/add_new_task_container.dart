import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/feature/screens/home_screen/riverpod/show_today_tasks_provider.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/models/add_task_model.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/riverpod/progress_provider.dart';

import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../../../common_widgets/common_widgets.dart';
import '../riverpod/pending_task_provider.dart';
import 'add_task_date_picker.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({
    super.key,
    required this.style,
    required this.addTaskDateTEController,
  });

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
                builder: (_, ref, _) {
                      return Center(
                      child: CommonWidgets.primaryButton(
                        title: 'Add Task',
                        radius: 30.r,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            final taskTitle = titleController.text.trim();
                            final date = widget.addTaskDateTEController.text.trim();

                            final chapID = ref.watch(selectedChapterId);
                            final pendingTasks = ref.watch(pendingTaskListProvider);

                            // Check for duplicate
                            final isDuplicate = pendingTasks.any((task) =>
                            task.chapterId == chapID &&
                                task.title == taskTitle &&
                                task.date == date);

                            if (isDuplicate) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Task with same title and date already exists'),
                                ),
                              );
                              return; // Do not proceed further
                            }

                            final random = Random();
                            int taskId = random.nextInt(1000);
                            ref.read(selectedTaskId(chapID).notifier).state = taskId.toString();
                            debugPrint("Chapter Id: $chapID");
                            debugPrint("Task Id: $taskId");

                            ref.read(pendingTaskListProvider.notifier).add(
                              TaskModel(
                                chapterId: chapID,
                                taskId: taskId.toString(),
                                title: taskTitle,
                                date: date,
                                difficulty: '',
                              ),
                            );

                            ref.read(pendingTaskCount(chapID).notifier).state++;
                            ref.read(showPendingTasks.notifier).state = 1;

                            titleController.clear();
                            widget.addTaskDateTEController.clear();
                          }
                        },

                        isIconOn: true,
                        width: 271.w,
                      ),
                    );
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
