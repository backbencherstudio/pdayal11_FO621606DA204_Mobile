import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/feature/screens/today_study_task/widgets/resource_card.dart';

import '../riverpod/study_resource_provider.dart';

class ResourceCardContainer extends StatelessWidget {
  const ResourceCardContainer({super.key, required this.style});

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final chapterList = ref.watch(resourceListProvider);
        return Column(
          children: [
            ...List.generate(chapterList.length, (index) {
              final item = chapterList[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: ResourceCard(style: style, title: item.title),
              );
            }),
          ],
        );
      },
    );
  }
}
