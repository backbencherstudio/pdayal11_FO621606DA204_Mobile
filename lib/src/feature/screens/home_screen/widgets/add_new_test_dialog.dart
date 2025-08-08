import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pdayal1_mobile/src/core/constant/icons.dart';
import 'package:pdayal1_mobile/src/feature/common_widgets/common_widgets.dart';
import 'package:pdayal1_mobile/src/feature/screens/home_screen/widgets/title_text.dart';
import '../../../../core/theme/theme_extension/color_pallete.dart';
import '../models/chapter_model.dart';
import '../riverpod/show_today_tasks_provider.dart';
import 'cancel_button.dart';
import 'date_picker.dart';

void onTapAddNewTest(BuildContext context) {
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder: (_) {
      final style = Theme.of(context).textTheme;
      return ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Dialog(
          backgroundColor: Colors.white,
          elevation: 1,
          child: SizedBox(
            // height: 487.h,
            width: 335.w,
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add New Test',
                          style: style.titleMedium?.copyWith(
                            color: AppColor.blackText,
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            AppIcons.cancel,
                            width: 20.w,
                            height: 20.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TitleText(style: style, title: 'Test Name'),
                          SizedBox(height: 10.h),
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'Enter your Test Name',
                              hintStyle: style.bodyMedium?.copyWith(
                                color: AppColor.secondaryTextColor,
                              ),
                            ),
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Please enter your Test Name';
                            //   }
                            //   return null;
                            // }
                          ),
                          SizedBox(height: 18.h),
                          TitleText(style: style, title: 'Test Date'),
                          SizedBox(height: 10.h),
                          DatePicker(dateController: dateController),
                          SizedBox(height: 18.h),
                          TitleText(style: style, title: 'Topics to Study'),
                          SizedBox(height: 10.h),
                          TextFormField(
                            controller: descriptionController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            maxLines: 4,
                            decoration: InputDecoration(
                              hintText:
                                  "Enter topics separated by commas (e.g.\n Algebra, Geometry, Statistics)",
                              hintStyle: style.bodyMedium?.copyWith(
                                color: AppColor.secondaryTextColor,
                              ),
                            ),
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Please enter your Test Name';
                            //   }
                            //   return null;
                            // }
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            children: [
                              Expanded(child: CancelButton()),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: Consumer(
                                  builder: (_, ref, __) {
                                    return CommonWidgets.primaryButton(
                                      title: 'Add Test',
                                      radius: 8.r,
                                      onTap: () {
                                        final random = Random();
                                        int chapterId = random.nextInt(1000);
                                        if (formKey.currentState!.validate()) {
                                          final title =
                                              nameController.text.trim();
                                          final date =
                                              dateController.text.trim();

                                          final topics = descriptionController.text.trim();

                                          ref
                                              .read(
                                                chapterListProvider.notifier,
                                              )
                                              .add(
                                                Chapter(
                                                  chapterId: chapterId.toString(),
                                                  title: title,
                                                  date: date,
                                                  topics: topics,
                                                ),
                                              );
                                          ref
                                              .read(showTodayTasks.notifier)
                                              .state = 1;
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      isIconOn: true,
                                      width: 144.w,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
