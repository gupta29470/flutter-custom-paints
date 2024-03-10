import 'package:flutter/material.dart';

class RectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.redAccent;

    // canvas.drawRect(
    //   Rect.fromCenter(
    //     center: Offset(size.width / 2, size.height / 2),
    //     width: size.width,
    //     height: size.height,
    //   ),
    //   paint,
    // );

    // canvas.drawRect(
    //   Rect.fromCircle(
    //     center: Offset(size.width / 2, size.height / 2),
    //     radius: 40,
    //   ),
    //   paint,
    // );

    // canvas.drawRect(
    //   Rect.fromLTWH(0, 0, size.width, size.height),
    //   paint,
    // );

    canvas.drawRect(
      Rect.fromLTRB(0, 0, size.height, size.width),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
