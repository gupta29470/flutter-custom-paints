import 'package:flutter/material.dart';

class AddRRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;

    Rect rectOne = const Rect.fromLTWH(10, 20, 200, 200);
    RRect rRect = RRect.fromRectAndRadius(
      rectOne,
      const Radius.circular(12),
    );

    Path path = Path();

    path.addRRect(
      rRect,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
