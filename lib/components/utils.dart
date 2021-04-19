import 'package:flutter/material.dart';

class Utils {
  static Size textSize(String _text, TextStyle _style, double _maxWidth) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: _text,
        style: _style,
      ),
      textDirection: TextDirection.ltr,
    )..layout(
        minWidth: 0,
        maxWidth: _maxWidth,
      );
    return textPainter.size;
  }
}
