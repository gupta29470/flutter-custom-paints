import 'package:flutter/material.dart';

class ConicToPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Path path = Path()
      ..moveTo(0, size.height / 2)
      ..conicTo(
        size.width / 2,
        size.height,
        size.width,
        size.height / 2,
        0.5,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
