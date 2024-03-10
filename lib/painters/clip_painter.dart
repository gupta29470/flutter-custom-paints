import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ClipPainter extends CustomPainter {
  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    Offset canvasCenter = Offset(size.width / 2, size.height / 2);
    Rect canvasSize = Offset.zero & size;
    Rect halfCanvasSize = Offset.zero & size / 2;
    Paint blackPaint = Paint()..color = Colors.black;
    Paint bluePaiint = Paint()..color = Colors.blue;

    // Simply clipping
    // canvas.clipRect(halfCanvasSize);

    // Giving radius
    // canvas.clipRRect(
    //   RRect.fromRectAndRadius(
    //     halfCanvasSize,
    //     const Radius.circular(12),
    //   ),
    // );

    // Clipping in oval shape
    canvas.clipPath(Path()..addOval(halfCanvasSize));

    canvas.drawRect(canvasSize, blackPaint);

    canvas.drawPath(
      Path()
        ..addOval(
          Rect.fromCenter(
            center: canvasCenter,
            width: size.width / 2,
            height: size.height / 2,
          ),
        ),
      bluePaiint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
