import 'package:flutter/material.dart';
import 'package:web_rtc/dummy_data/user_message.dart';

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

  static String stringDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
