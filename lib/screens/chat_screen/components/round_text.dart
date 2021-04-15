import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:web_rtc/model/message.dart';

class RoundTextContainer extends StatelessWidget {
  final Message message;
  final double width;
  final double height;
  final bool isMe;
  final style;

  final Radius _cornerRadius = Radius.circular(8);

  RoundTextContainer({
    Key? key,
    required this.message,
    required this.width,
    required this.height,
    required this.isMe,
    required this.style,
  });

  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(message.sentTime.toIso8601String());
    String time = DateFormat.Hms().format(dateTime);

    double fontTimeS = Theme.of(context).textTheme.subtitle1!.fontSize! / 2;
    return Container(
      width: width,
      height: height + fontTimeS,

      ///TODO:: change height
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              message.text,
              // softWrap: false,
              // overflow: TextOverflow.clip,
              // maxLines: 1,
              textAlign: TextAlign.start,
              style: style ?? GoogleFonts.lato(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FittedBox(
              child: Text(
                time,
                softWrap: false,
                overflow: TextOverflow.clip,
                // maxLines: 1,
                textAlign: TextAlign.end,
                style: GoogleFonts.lato(
                  fontSize: fontTimeS,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
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
