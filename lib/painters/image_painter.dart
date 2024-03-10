import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ImagePainter extends CustomPainter {
  final ui.Image image;

  ImagePainter(this.image);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    Paint paint = Paint();
    // if will overflow image
    // canvas.drawImage(
    //   image,
    //   Offset.zero,
    //   paint,
    // );

    final imageSize = Size(image.width.toDouble(), image.height.toDouble());

    canvas.drawImageRect(
      image,
      (Offset.zero & imageSize),
      (Offset.zero & size),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
