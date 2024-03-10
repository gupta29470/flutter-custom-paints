import 'dart:math';

import 'package:flutter/material.dart';

class AddArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;

    Rect rectOne = Rect.fromLTWH(10, 20, size.width, size.height);

    Path path = Path();

    path.addArc(
      rectOne,
      90,
      pi,
    );

    // path.addArc(
    //   rectOne,
    //   90,
    //   -pi,
    // );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
