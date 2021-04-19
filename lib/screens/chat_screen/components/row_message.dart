import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_rtc/model/message.dart';

import 'round_text.dart';

class RowMessage extends StatelessWidget {
  final String photUrl;
  final bool isMe;
  final Message msg;
  final bool drawAvatar;

  RowMessage({
    Key? key,
    required this.msg,
    required this.photUrl,
    required this.isMe,
    required this.drawAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return buildRow(constraints);
      },
    );
  }

  Widget buildRow(BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          ///TODO:: control the logo if continuse chat
          ///based on that use icon or hide
          if (isMe) buildLogo(),
          RoundTextContainer(
            message: msg,
            isMe: isMe,
          ),
          // if (!isMe) buildLogo(),
        ],
      ),
    );
  }

  Padding buildLogo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ClipOval(
        child: drawAvatar
            ? Image.asset(
                photUrl,
                width: kToolbarHeight * .5,
                fit: BoxFit.cover,
              )
            : SizedBox(
                width: kToolbarHeight * .5,
              ),
      ),
    );
  }
}
