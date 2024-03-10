import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class PlotPointsPainter extends CustomPainter {
  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    Paint paint = Paint();
    paint.strokeWidth = 5;
    paint.color = Colors.black;

    // final List<Offset> points = [
    //   Offset.zero,
    //   Offset(size.width, 0),
    //   Offset(size.width / 2, size.height / 2),
    //   Offset.zero,
    // ];

    final Float32List rawPoints = Float32List.fromList([
      0,
      0,
      size.width,
      0,
      size.width / 2,
      size.height / 2,
      0,
      0,
    ]);

    // canvas.drawPoints(
    //   ui.PointMode.polygon,
    //   points,
    //   paint,
    // );

    // more optimised than drawPoints
    canvas.drawRawPoints(
      ui.PointMode.polygon,
      rawPoints,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
