import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundTextContainer extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final bool isMe;
  final style;

  final Radius _cornerRadius = Radius.circular(8);

  RoundTextContainer({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    required this.isMe,
    required this.style,
  });

  Widget build(BuildContext context) {
    ///TODO:: set width = msgLength + padding
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Text(
          text,
          // softWrap: false,
          // overflow: TextOverflow.clip,
          // maxLines: 1,
          style: style ?? GoogleFonts.lato(),
        ),
      ),
      decoration: BoxDecoration(
        color:
            isMe ? Colors.orange.withOpacity(.7) : Colors.blue.withOpacity(.7),
        borderRadius: BorderRadius.only(
          topLeft: _cornerRadius,
          topRight: _cornerRadius,
          bottomLeft: isMe ? Radius.zero : _cornerRadius,
          bottomRight: isMe ? _cornerRadius : Radius.zero,
        ),
      ),
    );
  }
}
