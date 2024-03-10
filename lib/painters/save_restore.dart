import 'package:flutter/material.dart';

class SaveRestorePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();

    canvas.translate(50, 0);
    // only this rect is moving 50 to x-axis

    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      Paint()..color = Colors.blue,
    );

    canvas.restore();

    // this rect is on same position
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width / 2,
        height: size.height / 2,
      ),
      Paint()..color = Colors.yellow,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
