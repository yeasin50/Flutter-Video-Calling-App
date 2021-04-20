import 'package:flutter/material.dart';

class Utils {
  ///`call duration`
  static String duratuin2string(int _sec) {
    Duration duration = Duration(seconds: _sec);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

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
