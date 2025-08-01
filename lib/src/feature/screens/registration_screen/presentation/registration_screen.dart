import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pdayal1_mobile/src/core/constant/images.dart';
import 'package:pdayal1_mobile/src/core/theme/theme_extension/color_pallete.dart';
import 'package:pdayal1_mobile/src/feature/common_widgets/common_widgets.dart';
import 'package:pdayal1_mobile/src/feature/common_widgets/primary_button/primary_button.dart';

import '../../../../core/routes/route_constant.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final Shader textGradient = CommonWidgets.textGradient();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 218.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.containerBg1.withValues(alpha: 0.1),
                    AppColor.containerBg2.withValues(alpha: 0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.books, width: 53.w, height: 58.h),
                      SizedBox(height: 24.h),

                      Text(
                        'Welcome To TestReady',
                        style: style.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = textGradient,
                        ),
                      ),

                      SizedBox(height: 10.h),
                      Text(
                        textAlign: TextAlign.center,
                        "Your intelligent study companion for test success",
                        style: style.bodyMedium?.copyWith(
                          color: AppColor.profileTextColor,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Text(
                        "What's your name?",
                        style: style.bodyLarge?.copyWith(
                          color: AppColor.textColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          hintStyle: style.bodyMedium?.copyWith(
                            color: AppColor.secondaryTextColor,
                          ),
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Enter a valid Name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24.h),
                      CommonWidgets.primaryButton(
                        title: 'Get Started',
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.push(RouteConst.homeScreen);
                          }
                        },
                        isIconOn: false,
                        width: 3156.w,
                        radius: 4.r,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
