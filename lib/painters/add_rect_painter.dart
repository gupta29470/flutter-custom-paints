import 'package:flutter/material.dart';

class AddRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;

    Rect rectOne = const Rect.fromLTWH(10, 20, 200, 200);
    Rect rectTwo = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 200,
      height: 200,
    );

    Path path = Path();
    path.addRect(rectOne);
    path.addRect(rectTwo);

    path.addOval(rectTwo);

    path.addRRect(
      RRect.fromRectAndRadius(
        rectOne,
        const Radius.circular(12),
      ),
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
