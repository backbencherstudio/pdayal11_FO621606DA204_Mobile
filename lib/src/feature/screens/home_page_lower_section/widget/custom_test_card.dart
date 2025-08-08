import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdayal1_mobile/src/core/constant/icons.dart';
import 'package:pdayal1_mobile/src/feature/screens/home_page_lower_section/model/test_card_data.dart';

import '../riverpod/custom_test_card_state.dart';

class CustomTestCard extends ConsumerWidget {
  final int index;
  const CustomTestCard({
    super.key,
    required this.index
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backGradColor = ref.watch(randomBackgroundColor(index));
    final borderGradColor = ref.watch(randomBorderColor(index));
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 5.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: LinearGradient(
              colors: borderGradColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              gradient: LinearGradient(
                colors: backGradColor,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight
              )
          ),
          child: Column(
            children: [
                Text(dummyTestCards[index].cardTitle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        children: [SvgPicture.asset(AppIcons.calenderIcon),
                    Text(dummyTestCards[index].cardDate),
                        ]
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: backGradColor,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                        )
                      ),
                      child: Text((dummyTestCards[index].leftDays == 0) ? "Completed" : "${dummyTestCards[index].leftDays} days left"),
                    )
                  ],
                ),
              Row(
                children: [
                  Row(
                      children: [SvgPicture.asset(AppIcons.bookIcon),
                        Text("Topic(${dummyTestCards[index].topics?.length})"),
                      ]
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFEFEDFF)
                    ),
                    child: Text(dummyTestCards[index].topics![0]),
                  ),
                ],
              ),
              Row(
                children: [
                  Row(
                      children: [SvgPicture.asset(AppIcons.growIcon),
                        Text("Progress"),
                      ]
                  ),
                  Text("100%"),
                  LinearProgressIndicator(),
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.partyIcon),
                          Text("All Done"),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.partyIcon),
                          Text("Excellent"),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
              )
          ),
      ),
    );
  }
}
