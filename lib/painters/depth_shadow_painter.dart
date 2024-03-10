import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class DepthShadowPainter extends CustomPainter {
  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    Paint paint = Paint();

    final path = Path();
    path.addOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width / 2,
        height: size.height / 2,
      ),
    );

    canvas.drawShadow(path, Colors.blue, 10, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
