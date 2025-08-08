import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdayal1_mobile/src/core/theme/theme_extension/color_pallete.dart';
import '../../../../core/constant/icons.dart';
import '../riverpod/add_task_date_picker_provider.dart';

class AddTaskDatePicker extends StatefulWidget {
  const AddTaskDatePicker({super.key, required this.dateController});

  final TextEditingController dateController;

  @override
  State<AddTaskDatePicker> createState() => _AddTaskDatePickerState();
}

class _AddTaskDatePickerState extends State<AddTaskDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final selectedDate = ref.watch(addTaskDateProvider);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted && widget.dateController.text != selectedDate) {
            widget.dateController.text = selectedDate;
          }
        });

        return TextFormField(
          controller: widget.dateController,
          keyboardType: TextInputType.datetime,
          textInputAction: TextInputAction.next,
          readOnly: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 15.h,
            ),
            hintText: 'mm/dd/yyyy',
            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColor.greyTextColor,
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.all(8.w),
              child: SvgPicture.asset(
                AppIcons.calender,
                height: 20.h,
                width: 20.w,
              ),
            ),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 36.h,
              maxWidth: 36.w,
            ),
            fillColor: AppColor.white,
            filled: true,
          ),
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              final today = DateTime.now();
              final yesterday = today.subtract(Duration(days: 1));
              final tomorrow = today.add(Duration(days: 1));

              final normalizedPickedDate = DateTime(
                pickedDate.year,
                pickedDate.month,
                pickedDate.day,
              );
              final normalizedToday = DateTime(
                today.year,
                today.month,
                today.day,
              );
              final normalizedYesterday = DateTime(
                yesterday.year,
                yesterday.month,
                yesterday.day,
              );
              final normalizedTomorrow = DateTime(
                tomorrow.year,
                tomorrow.month,
                tomorrow.day,
              );

              String formattedDate;

              if (normalizedPickedDate.isAtSameMomentAs(normalizedToday)) {
                formattedDate = "Today";
              } else if (normalizedPickedDate.isAtSameMomentAs(
                normalizedYesterday,
              )) {
                formattedDate = "Yesterday";
              } else if (normalizedPickedDate.isAtSameMomentAs(
                normalizedTomorrow,
              )) {
                formattedDate = "Tomorrow";
              } else {
                formattedDate =
                    "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
              }

              ref.read(addTaskDateProvider.notifier).state = formattedDate;

              debugPrint("\n\n onTap -> $formattedDate\n\n");
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    widget.dateController.dispose();
    super.dispose();
  }
}
