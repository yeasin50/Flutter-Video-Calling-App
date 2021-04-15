import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_rtc/dummy_data/user_message.dart';
import 'package:web_rtc/model/message.dart';
import 'package:web_rtc/provider/dummy_data.dart';
import 'components/row_message.dart';

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final String photUrl = "assets/images/yeasin.jpg";

  final bool isMe = false;

  ///TODO:: make a list of msg, then based on moduls assign

  String preUId = "";

  Future<int> _msgSize() async {
    return dummyMessages.length;
  }

  ///FIXME:: stream isnot working
  @override
  Widget build(BuildContext context) {
    return Consumer<MessageProvider>(
      builder: (_, data, __) {
        if (data.messages.length > 0) {
          // return Text("size ${data.messages.length}");
          return listViewBuilder(data.messages);
        } else
          return Text("data: null");
      },
    );
  }

  Expanded listViewBuilder(List<Message> messages) {
    return Expanded(
      child: ListView.builder(
          itemCount: messages.length,
          reverse: true,
          itemBuilder: (context, index) {
            // final   = dummyMessages[index];
            ///check if this message alreay sent by current index user
            bool _draw = false;
            if (index > 1) {
              _draw = messages[index].senderUId !=
                  messages[index - 1].senderUId;
            }
            if (index == 0) _draw = true;
            return RowMessage(
              /// Here im taking myself as `User2`
              isMe:messages[index].senderUId == "user2",
              msg: messages[index],
              photUrl: photUrl,
              drawAvatar: _draw,
            );
          }),
    );
  }
}
