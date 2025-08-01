import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdayal1_mobile/src/feature/screens/home_page_lower_section/model/test_card_data.dart';

import '../riverpod/custom_test_card_state.dart';

class CustomTestCard extends ConsumerWidget {
  const CustomTestCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backGradColor = ref.watch(randomBackgroundColor);
    final borderGradColor = ref.watch(randomBorderColor);
    return Container(
      padding: EdgeInsets.only(top: 5.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(
            colors: backGradColor,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: LinearGradient(
              colors: borderGradColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight
            )
        ),
        child: Column(
          children: [
              Text(dummyTestCards[0].cardTitle),
          ],
        ),
      ),
    );
  }
}
