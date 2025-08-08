import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdayal1_mobile/src/feature/screens/home_page_lower_section/widget/custom_test_card.dart';

class LowerHomePageScreen extends StatelessWidget {
  const LowerHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTestCard(index: 1),
              CustomTestCard(index: 1),
              CustomTestCard(index: 1)
            ],
          ),
        ),
      ),
    );
  }
}
