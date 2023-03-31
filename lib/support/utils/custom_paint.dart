import 'package:flexapp/support/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MyCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();

    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;
    paint.color = AppColors.blueTheme;
    path.moveTo(0, -200);

    path.lineTo(size.width, size.height);
    path.lineTo(400, -200);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
