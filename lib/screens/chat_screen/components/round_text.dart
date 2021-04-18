import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;
import 'package:web_rtc/components/utils.dart';
import 'package:web_rtc/config/size.dart';
import 'package:web_rtc/model/message.dart';
// import 'dart:ui' as ui;

class RoundTextContainer extends StatelessWidget {
  final Message message;

  final bool isMe;

  RoundTextContainer({
    Key? key,
    required this.message,
    required this.isMe,
  });

  final Radius _cornerRadius = Radius.circular(8);

  bool singleLine = false;

  final double _timeTextSize = 8;

  ///TODO:: set ScreenSize at top level before Row
  ///call and init here
  Widget build(BuildContext context) {
    double maxWidth = SizeConfig.screenWidth;
    double maxHeight = SizeConfig.screenHeight;

    ///`Time formate`
    final DateTime dateTime =
        DateTime.parse(message.sentTime.toIso8601String());
    final String time = intl.DateFormat.Hms().format(dateTime);

    TextStyle _styleMsg = GoogleFonts.lato(
      fontSize: 22,
    );

    TextStyle _styleTime = GoogleFonts.lato(
      fontSize: _timeTextSize,
    );

    double _width =
        Utils.textSize(message.text, _styleMsg, maxWidth * .8).width;

    double _height =
        Utils.textSize(message.text, _styleMsg, maxHeight * .7).height + 10;

    //Just checking if it fit on single line
    if (_width < maxWidth * .7) {
      singleLine = true;
      _width += Utils.textSize(time, _styleTime, maxWidth * .4).width;
    }

    /// if message length is small `Single line`
    if (singleLine)
      return Container(
        width: _width + 1,
        height: _height,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildText(_styleMsg),
          ],
        ),
        decoration: buildBoxDecoration(),
      );
    else
      return Container(
        width: _width + 1,
        height: _height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ///`message`
            buildText(_styleMsg),
          ],
        ),
        decoration: buildBoxDecoration(),
      );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      color: isMe ? Colors.orange.withOpacity(.7) : Colors.blue.withOpacity(.7),
      borderRadius: BorderRadius.only(
        topLeft: _cornerRadius,
        topRight: _cornerRadius,
        bottomLeft: isMe ? Radius.zero : _cornerRadius,
        bottomRight: isMe ? _cornerRadius : Radius.zero,
      ),
    );
  }

  Padding buildText(TextStyle _styleMsg) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        message.text,
        // softWrap: false,
        // overflow: TextOverflow.clip,
        // maxLines: 1,
        textAlign: TextAlign.start,
        style: _styleMsg,
      ),
    );
  }
}
