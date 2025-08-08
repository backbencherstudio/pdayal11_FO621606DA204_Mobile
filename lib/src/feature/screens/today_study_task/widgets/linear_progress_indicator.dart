import 'package:flutter/material.dart';

class GradientProgressBar extends StatelessWidget {
  final double progress;
  final double borderRadius;

  const GradientProgressBar({
    super.key,
    required this.progress,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, 8),
      painter: GradientProgressPainter(progress, borderRadius),
    );
  }
}

class GradientProgressPainter extends CustomPainter {
  final double progress;
  final double borderRadius;

  GradientProgressPainter(this.progress, this.borderRadius);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =
        Paint()
          ..shader = LinearGradient(
            colors: [Color(0xff3866D8), Color(0xff04971F)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(
            Rect.fromLTRB(0, 0, size.width * progress, size.height),
          );

    RRect progressRect = RRect.fromLTRBR(
      0,
      0,
      size.width * progress,
      size.height,
      Radius.circular(borderRadius),
    );
    canvas.drawRRect(progressRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
