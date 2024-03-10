import 'package:flutter/material.dart';

class DoubleRRect extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.amber;

    canvas.drawDRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(16),
      ),
      RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, size.width * 0.8, size.height * 0.8),
        topLeft: const Radius.circular(12),
        topRight: const Radius.circular(24),
        bottomLeft: const Radius.circular(48),
        bottomRight: const Radius.circular(96),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
