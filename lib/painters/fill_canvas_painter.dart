import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class FillCanvasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // fill entire screen
    // canvas.drawColor(
    //   Colors.indigo,
    //   BlendMode.src,
    // );

    Paint paint = Paint();
    paint.color = Colors.amber;
    paint.style = PaintingStyle.fill;
    paint.shader = ui.Gradient.linear(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      [
        Colors.amber,
        Colors.indigo,
        Colors.teal,
      ],
      [0.0, 0.5, 1.0],
    );
    canvas.clipRect(Offset.zero & size);
    canvas.drawPaint(paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
