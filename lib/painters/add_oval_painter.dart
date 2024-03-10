import 'package:flutter/material.dart';

class AddOvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;

    Rect rectOne = const Rect.fromLTWH(10, 20, 300, 400);

    Path path = Path();

    path.addOval(
      rectOne,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
