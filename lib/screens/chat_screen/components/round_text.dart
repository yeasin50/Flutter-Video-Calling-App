import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;
import 'package:web_rtc/components/utils.dart';
import 'package:web_rtc/config/size.dart';
import 'package:web_rtc/model/message.dart';
// import 'dart:ui' as ui;

// ignore: must_be_immutable
class RoundTextContainer extends StatelessWidget {
  final Message message;

  final bool isMe;

  late String time;

  RoundTextContainer({
    Key? key,
    required this.message,
    required this.isMe,
  });

  final Radius _cornerRadius = Radius.circular(10);

  bool singleLine = false;

  ///TODO:: set ScreenSize at top level before Row
  ///call and init here

  final TextStyle _styleMsg = GoogleFonts.lato(
    fontSize: 22,
  );

  final TextStyle _styleTime = GoogleFonts.lato(
    fontSize: 8,
    color: Colors.white,
  );

  Widget build(BuildContext context) {
    double maxWidth = SizeConfig.screenWidth;
    double maxHeight = SizeConfig.screenHeight;

    ///`Time formate`
    final DateTime dateTime =
        DateTime.parse(message.sentTime.toIso8601String());
    time = intl.DateFormat.Hms().format(dateTime);
    double _textWidth =
        Utils.textSize(message.text, _styleMsg, maxWidth * .8).width;

    double _height =
        Utils.textSize(message.text, _styleMsg, maxHeight * .7).height + 10;

    Size _timeTextSize = Utils.textSize(time, _styleTime, maxWidth * .4);

    //Just checking if it fit on single line
    if (_textWidth < maxWidth * .7) {
      singleLine = true;
      _textWidth += _timeTextSize.width * 2.4;
    }

    /// check if message `sent/delivered`
    double sFontSize = SizeConfig.subtitle1;
    double markDownBoxWidth = sFontSize;

    message.isSent = false;
    message.isDelivered = false;
    if (!message.isSent) {
      _textWidth -= sFontSize * 1.3;
    }

    /// if message length is small `Single line`
    if (singleLine)
      return Container(
        width: _textWidth + 1,
        height: _height,
        padding: EdgeInsets.symmetric(vertical: 2),
        margin: EdgeInsets.only(right: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            buildText(_styleMsg),
            buildMarkDownRow(markDownBoxWidth),
          ],
        ),
        decoration: buildBoxDecoration(),
      );
    else
      return Container(
        width: _textWidth + 1,
        height: _height + _timeTextSize.height,
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.only(right: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ///`message`
            buildText(_styleMsg),
            buildMarkDownRow(markDownBoxWidth),
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

  ///`Time + MarkDown`(sent, )

  Row buildMarkDownRow(double sFontSize) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        ///` sent Time`
        FittedBox(
          child: Text(
            time,
            softWrap: false,
            overflow: TextOverflow.clip,
            // textAlign: TextAlign.right,
            style: _styleTime,
          ),
        ),

        ///`markdown`
        if (message.isSent)
          SizedBox(
            width: sFontSize * 1.5,
            height: sFontSize,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(-1, 1),
                  child: Icon(
                    Icons.done,
                    size: sFontSize,
                    color: Colors.blue,
                  ),
                ),
                if (message.isDelivered)
                  Align(
                    alignment: Alignment(1, 1),
                    child: Icon(
                      Icons.done,
                      size: sFontSize,
                      color: Colors.blue,
                    ),
                  ),
              ],
            ),
          )
      ],
    );
  }

  ///`Text Message`
  Padding buildText(TextStyle _styleMsg) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
