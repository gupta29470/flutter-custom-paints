import 'dart:math';

import 'package:flutter/material.dart';

class AddArcToPointPainter extends CustomPainter {
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
      pi / 2,
    );

    path.arcToPoint(
      const Offset(100, 300),
      radius: const Radius.circular(32),
      largeArc: true,
      clockwise: true,
    );

    path.arcToPoint(
      const Offset(200, 400),
      radius: const Radius.elliptical(32, 16),
      largeArc: true,
      clockwise: true,
      rotation: 45,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
