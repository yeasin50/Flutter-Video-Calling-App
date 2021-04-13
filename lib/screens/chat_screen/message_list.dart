import 'package:flutter/material.dart';
import 'package:web_rtc/dummy_data/user_message.dart';
import 'package:web_rtc/model/message.dart';
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

  Future<List<Message>> getMessages() async {
    return dummyGMessage;
  }

  ///`Stream messages`
  Stream<List<Message>> _streamMessage() async* {
    yield await getMessages();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: _streamMessage(),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return Expanded(
              child: ListView.builder(
                  itemCount: dummyMessages.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    // final   = dummyMessages[index];
                    ///check if this message alreay sent by current index user

                    bool _draw = false;
                    if (index > 1) {
                      _draw = dummyMessages[index].senderUId !=
                          dummyMessages[index - 1].senderUId;
                    }
                    if (index == 0) _draw = true;

                    return RowMessage(
                      /// Here im taking myself as `User2`
                      isMe: dummyMessages[index].senderUId == "user2",
                      msg: dummyMessages[index].text,
                      photUrl: photUrl,
                      drawAvatar: _draw,
                    );
                  }),
            );
          else
            return Text("data: null");
        });
  }
}
