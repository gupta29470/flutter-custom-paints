import 'package:flutter/material.dart';

class CombiningPaths extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;

    Rect rect1 = Rect.fromCircle(
      center: Offset((size.width / 2 + size.width / 8), size.height / 2),
      radius: size.width / 2,
    );

    Path path1 = Path()..addOval(rect1);
    // canvas.drawPath(path1, paint);

    Rect rect2 = Rect.fromCircle(
      center: Offset((size.width / 2 - size.width / 8), size.height / 2),
      radius: size.width / 2,
    );

    Path path2 = Path()..addOval(rect2);
    // canvas.drawPath(path2, paint);

    canvas.drawPath(
      Path.combine(PathOperation.xor, path1, path2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
