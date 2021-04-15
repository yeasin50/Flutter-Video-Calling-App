import 'package:flutter/material.dart';
import 'package:web_rtc/model/message.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageBox extends StatelessWidget {
  // final String photUrl;
  // final bool isMe;
  // final Message msg;
  // final bool drawAvatar;

  // const MessageBox({
  //   required this.photUrl,
  //   required this.isMe,
  //   required this.msg,
  //   required this.drawAvatar,
  // });

  final _style = GoogleFonts.lato();
  String text = "get anasdasd asdsa";

  Size _textSize(var maxWidth) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: _style,
      ),
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        width: _textSize(222).width,
        child: Text(text),
      ),
    );
  }
}
