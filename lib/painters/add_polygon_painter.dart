import 'package:flutter/material.dart';

class AddPolygonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    Path path = Path();

    path.addPolygon(
      [
        Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height / 2),
        Offset(size.width, size.height / 2),
        Offset(size.width, size.height)
      ],
      false,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
