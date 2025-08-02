import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/icons.dart';
import '../riverpod/select_date_provider.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({super.key, required this.dateController});

  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final datePicker = ref.watch(selectedDateProvider);
        dateController.text = datePicker;
        return TextFormField(
          controller: dateController,
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
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              final formattedDate =
                  "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
              ref.read(selectedDateProvider.notifier).state = formattedDate;
            }
          },
        );
      },
    );
  }
}
