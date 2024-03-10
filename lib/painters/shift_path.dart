import 'package:flutter/material.dart';

class ShiftPath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint redPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    Paint indigoPaint = Paint()
      ..color = Colors.indigo
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    Path path = Path();

    path.addRect(rect);

    canvas.drawPath(path, redPaint);

    path.reset();

    path.addOval(rect);

    Path translatedPath = path.shift(Offset(size.width / 4, size.height / 4));

    canvas.drawPath(translatedPath, indigoPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
