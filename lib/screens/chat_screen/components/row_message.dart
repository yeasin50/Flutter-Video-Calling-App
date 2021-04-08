import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'round_text.dart';

class RowMessage extends StatelessWidget {
  final String photUrl;
  final bool isMe;
  final String msg;

  RowMessage({
    Key? key,
    required this.msg,
    required this.photUrl,
    required this.isMe,
  }) : super(key: key);

  final _style = GoogleFonts.lato();

  Size _textSize(var maxWidth) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: msg,
          style: _style,
        ),
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }

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
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          ///TODO:: control the logo if continuse chat
          ///based on that use icon or hide
          if (isMe) buildLogo(),
          RoundTextContainer(
            text: msg,
            style: _style,
            width: _textSize(constraints.maxWidth * .7).width +
                constraints.maxWidth * .05,
            height: _textSize(constraints.maxWidth * .7).height + kToolbarHeight* .2,
            isMe: isMe,
          ),
          if (!isMe) buildLogo(),
        ],
      ),
    );
  }

  Padding buildLogo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ClipOval(
        child: Image.asset(
          photUrl,
          width: kToolbarHeight * .5,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
