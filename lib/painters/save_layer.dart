import 'package:flutter/material.dart';

class SaveLayer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: 100,
        height: 100,
      ),
      Paint()..color = Colors.orange,
    );

    canvas.saveLayer(
      const Rect.fromLTWH(0, 0, 200, 200),
      Paint()..color = Colors.transparent.withOpacity(0.7),
    );

    canvas.drawRect(
      const Rect.fromLTWH(0, 0, 200, 200),
      Paint()..color = Colors.blue,
    );

    canvas.drawRect(
      const Rect.fromLTWH(0, 0, 100, 200),
      Paint()..color = Colors.yellow,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
