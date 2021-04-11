import 'package:flutter/material.dart';
import 'package:web_rtc/dummy_data/user_message.dart';
import 'components/row_message.dart';

// ignore: must_be_immutable
class MessageList extends StatelessWidget {
  final String photUrl = "assets/images/yeasin.jpg";

  final bool isMe = false;

  ///TODO:: make a list of msg, then based on moduls assign

  String preUId = "";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: dummyMessages.length,
          reverse: true,
          itemBuilder: (context, index) {
            // final   = dummyMessages[index];
            ///check if this message alreay sent by current index user

            bool _draw = true;
            if (index > 1) {
              _draw = dummyMessages[index].senderUId !=
                  dummyMessages[index - 1].senderUId;
            }
            return RowMessage(
              /// Here im taking myself as `User2`
              isMe: dummyMessages[index].senderUId == "user2",
              msg: dummyMessages[index].text,
              photUrl: photUrl,
              drawAvatar: _draw,
            );
          }),
    );
  }
}
