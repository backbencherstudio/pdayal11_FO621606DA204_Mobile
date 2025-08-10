import 'package:flutter/material.dart';

class GradientProgressBar extends StatelessWidget {
  final double progress;
  final double borderRadius;
  final List<Color>? colors;

  const GradientProgressBar({
    super.key,
    required this.progress,
    this.borderRadius = 8.0,
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, 8),  // Fixed height for the progress bar
      painter: GradientProgressPainter(progress, borderRadius, colors),
    );
  }
}

class GradientProgressPainter extends CustomPainter {
  final double progress;
  final double borderRadius;
  final List<Color>? colors;

  GradientProgressPainter(this.progress, this.borderRadius, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
        colors: colors ?? [Color(0xff3866D8), Color(0xff04971F)], // Default gradient
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(
        Rect.fromLTRB(0, 0, size.width * progress, size.height),
      );

    // Drawing the rounded rectangle
    RRect progressRect = RRect.fromLTRBR(
      0,
      0,
      size.width * progress,
      size.height,
      Radius.circular(borderRadius),  // Rounded corners
    );

    canvas.drawRRect(progressRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (oldDelegate is GradientProgressPainter) {
      return oldDelegate.progress != progress;
    }
    return true;
  }
}
