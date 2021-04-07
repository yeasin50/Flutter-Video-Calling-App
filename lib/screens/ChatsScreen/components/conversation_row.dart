import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_rtc/screens/ChatsScreen/components/custom_logo.dart';

import 'active_dot_widget.dart';

class ConversationRow extends StatelessWidget {
  final String name;
  final String lastConversation;
  final String lastMsgTime;
  final bool makeBold;
  final bool isActive;
  final Widget leading;
  final Function onPres;
  final Function onLongPres;

  ConversationRow({
    Key key,
    this.name,
    this.lastConversation,
    this.makeBold,
    this.isActive,
    this.leading,
    this.lastMsgTime,
    this.onPres,
    this.onLongPres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPres,
      onLongPress: onLongPres,
      splashColor: Colors.blue,
      borderRadius: BorderRadius.circular(15),
      child: ListTile(
        contentPadding: EdgeInsets.only(
          left: 4,
          right: 4,
        ),
        leading: isActive
            ? ActiveDotOnLogo(
                child: leading,
              )
            : CustomLogo(
                child: leading,
                isBorder: true,
                borderColor: Colors.grey.withOpacity(.5),
              ),
        title: Text(
          name,
          style: GoogleFonts.lato(
            fontWeight: !makeBold ? FontWeight.w400 : FontWeight.w800,
          ),
        ),
        subtitle: Text(
          lastConversation,
          style: GoogleFonts.lato(
            fontWeight: !makeBold ? FontWeight.w400 : FontWeight.w900,
          ),
        ),
        trailing: Text(
          lastMsgTime,
        ),
      ),
    );
  }
}
