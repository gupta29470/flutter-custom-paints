import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CustomTextPainter extends CustomPainter {
  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    ui.ParagraphStyle paragraphStyle = ui.ParagraphStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    ui.TextStyle textStyle = ui.TextStyle(
      color: Colors.indigo,
    );
    ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
      paragraphStyle,
    );

    paragraphBuilder.pushStyle(textStyle);

    paragraphBuilder.addText(
      "Ohh, there's a women, yeah a women. Women I love, got so fucking close, nearly end up fuckin everything.",
    );

    ui.Paragraph paragraph = paragraphBuilder.build();

    paragraph.layout(ui.ParagraphConstraints(width: size.width));

    canvas.drawParagraph(paragraph, Offset.zero);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
