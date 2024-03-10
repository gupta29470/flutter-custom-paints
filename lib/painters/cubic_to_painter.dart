import 'package:flutter/material.dart';

class CubitToPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Path path = Path()
      ..moveTo(0, size.height / 2)
      ..cubicTo(
        0,
        size.height / 8,
        size.width,
        size.height,
        size.width,
        size.height / 2,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
