import 'package:flutter/material.dart';
import 'package:pdayal1_mobile/src/feature/common_widgets/primary_button/primary_button.dart';

class CommonWidgets {


static Widget primaryButton({required String title, required double? radious, required void Function() onTap, required bool isIconOn, required double? width}){
  return PrimaryButton(title: title, onTap: onTap,borderRadius: radious, isIconOn: isIconOn,width: width,);
}

}