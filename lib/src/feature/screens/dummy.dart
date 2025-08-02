import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdayal1_mobile/src/feature/common_widgets/common_widgets.dart';

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 150.h,),
      CommonWidgets.primaryButton(title: "fgdsfh", radius: 12.h, onTap: (){}, isIconOn: false, width: 143.w)

        ],
      ),
    );
  }
}