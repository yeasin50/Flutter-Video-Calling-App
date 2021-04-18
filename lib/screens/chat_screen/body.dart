import 'package:flutter/material.dart';
import 'package:web_rtc/screens/chat_screen/components/footer.dart';
import 'package:web_rtc/screens/chat_screen/message_list.dart';

import 'components/header.dart';
import 'components/row_message.dart';

class ChatBody extends StatefulWidget {
  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
  
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChatAppBar(),
        Divider(
          color: Colors.grey,
        ),

        ///`messages`
        MessageList(),

        ///`footer`
        ChatFooter(),
      ],
    );
  }
}
