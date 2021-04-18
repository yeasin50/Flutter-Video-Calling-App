import 'package:flutter/material.dart';
import 'package:web_rtc/components/utils.dart';
import 'package:web_rtc/model/message.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageBox extends StatelessWidget {
  final Message message;

  MessageBox({
    required this.message,
  });

  late TextStyle _styleMsg, _styleTime;

  // String text = "hey amigo, hows'going everything hum, " +
  //     "hey amigo, hows'going everything hum, " +
  //     "hey amigo, hows'going everything hum, " +
  //     "hey amigo, hows'going everything hum, ";

  // String smallText = "hey";

  String date = "12/12/12";

  String time = "12:12 AM";

  bool sent = true;

  bool deliverd = true;
  double smallSize = 8;

  @override
  Widget build(BuildContext context) {
    _styleMsg = GoogleFonts.lato(
      fontSize: 22,
    );

    _styleTime = GoogleFonts.lato(
      fontSize: smallSize,
    );
    bool singleLine = false;

    return LayoutBuilder(
      builder: (context, constraints) {
        double textWidth =
            Utils.textSize(message.text, _styleMsg, constraints.maxWidth * .7)
                .width;

        double _height =
            Utils.textSize(message.text, _styleMsg, constraints.maxHeight)
                    .height *
                2;

        //Just checking if it fit on single line
        if (textWidth < constraints.maxWidth * .5) {
          singleLine = true;
          textWidth +=
              (Utils.textSize(time, _styleTime, constraints.maxWidth * .7).width) *
                  2;
        }

        /// if message length is small `Single line`
        if (singleLine)
          return Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            //// we have add padding and margin value
            width: textWidth + 1,
            height: _height,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildText(),
                SizedBox(
                  width: 12,
                ),
                markdownRow(),
              ],
            ),
          );

        /// if message length cant hold on `Large Text line`
        else
          return Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              // borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            //// we have add padding and margin value
            width: textWidth + 1,
            height: _height,
            child: Column(
              ///`multi line`
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildText(),
                markdownRow(),
              ],
            ),
          );
      },
    );
  }

  Text buildText() {
    return Text(
      message.text,
      style: _styleMsg,
    );
  }

  ///`markDown`
  Row markdownRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      // mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        ///` sent Time`
        Text(
          time,
          softWrap: false,
          // overflow: TextOverflow.clip,
          textAlign: TextAlign.right,
          style: _styleTime,
        ),

        ///`markdown`
        SizedBox(
          width: smallSize * 1.5,
          child: Stack(
            children: [
              if (sent)
                Align(
                  alignment: Alignment(-1, 1),
                  child: Icon(
                    Icons.done,
                    size: smallSize * 1.2,
                    color: Colors.blue,
                  ),
                ),
              if (deliverd)
                Align(
                  alignment: Alignment(1, 1),
                  child: Icon(
                    Icons.done,
                    size: smallSize * 1.2,
                    color: Colors.blue,
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
