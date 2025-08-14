import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constant/icons.dart';
import '../riverpod/select_date_provider.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, required this.dateController});

  final TextEditingController dateController;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final datePicker = ref.watch(selectedDateProvider);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (widget.dateController.text != datePicker) {
            widget.dateController.text = datePicker;
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
          ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter date';
              }
              return null;
            },

          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              DateTime today = DateTime.now();
              DateTime yesterday = today.subtract(Duration(days: 1));
              DateTime tomorrow = today.add(Duration(days: 1));

              DateTime normalizedPickedDate = DateTime(
                pickedDate.year,
                pickedDate.month,
                pickedDate.day,
              );
              DateTime normalizedToday = DateTime(
                today.year,
                today.month,
                today.day,
              );
              DateTime normalizedYesterday = DateTime(
                yesterday.year,
                yesterday.month,
                yesterday.day,
              );
              DateTime normalizedTomorrow = DateTime(
                tomorrow.year,
                tomorrow.month,
                tomorrow.day,
              );

              String formattedDate;

              if (normalizedPickedDate.isAtSameMomentAs(normalizedToday)) {
                formattedDate = "Today";
                ref.read(selectedDateProvider.notifier).state = formattedDate;
              } else if (normalizedPickedDate.isAtSameMomentAs(
                normalizedYesterday,
              )) {
                formattedDate = "Yesterday";
                ref.read(selectedDateProvider.notifier).state = formattedDate;
              } else if (normalizedPickedDate.isAtSameMomentAs(
                normalizedTomorrow,
              )) {
                formattedDate = "Tomorrow";
                ref.read(selectedDateProvider.notifier).state = formattedDate;
              } else {
                formattedDate =
                    "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
                ref.read(selectedDateProvider.notifier).state = formattedDate;
              }

              debugPrint("\n\n onTap -> $formattedDate\n\n");
            }
          },
        );
      },
    );
  }
}
