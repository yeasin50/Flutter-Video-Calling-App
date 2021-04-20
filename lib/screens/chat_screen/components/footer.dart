import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_rtc/dummy_data/user_message.dart';
import 'package:web_rtc/model/message.dart';
import 'package:web_rtc/provider/dummy_data.dart';

/// when clicking more actions button>
///  - open the `actions row`, hide `send` button
///  - else close the `action panel`
///  ** `send icon color` depend on text field
///
class ChatFooter extends StatefulWidget {
  @override
  _ChatFooterState createState() => _ChatFooterState();
}

/// Here im taking myself as `User2`
class _ChatFooterState extends State<ChatFooter>
    with SingleTickerProviderStateMixin {
  bool _sendButton = false;
  bool _openMoreActions = false;
  TextEditingController _messageController = new TextEditingController();

  /// `textForm decoration`
  final InputDecoration _inputDecoration = InputDecoration(
    contentPadding: EdgeInsets.all(8),
    hintText: "Aaa..",
    fillColor: Colors.grey.withAlpha(60),
    filled: true,
    labelStyle: TextStyle(
      color: Colors.white.withOpacity(.7),
    ),
    suffix: IconButton(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      tooltip: "Emoji",
      constraints: BoxConstraints.tightFor(height: 12),
      icon: Icon(
        Icons.emoji_emotions,
        color: Colors.blue,
      ),
      onPressed: () {},
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: Colors.blueGrey,
      ),
    ),
  );

  _sendMessage() {
    // "user1" : "user2"
    final msg = Message(
      senderUId: "user1",
      receiverUId: "user2",
      text: _messageController.text.toString().trim(),
      sentTime: DateTime.now(),
    );
    Provider.of<MessageProvider>(context, listen: false).addMessage(msg);

    setState(() {
      _sendButton = false;
      _messageController.text = "";
    });
    print(dummyMessages.length);
  }

//// extra anim for `more` button
  ///TODO:: get render Size of `row`
  double _containderWidth = 120;
  late AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  /// open right more send option for image/ mic
  _onMore() {
    if (_openMoreActions)
      _controller.reverse();
    else
      _controller.forward();
    setState(() {
      _openMoreActions = !_openMoreActions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,

          ///TODO:: remove border and set BG color
          border: Border.all(
            color: Colors.grey,
          )),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            tooltip: "more",
            icon: Icon(
              _openMoreActions ? Icons.close : Icons.grid_view,
              color: Colors.blue,
            ),
            onPressed: _onMore,
          ),
          ////`More send`
          AnimatedContainer(
            width: _openMoreActions ? _containderWidth : 0.0,
            curve: Curves.easeInOutQuad,
            alignment: Alignment.centerLeft,
            duration: Duration(milliseconds: 300),
            child: FittedBox(
              child: ScaleTransition(
                scale: _controller,
                child: actionButton(),
              ),
            ),
          ),
          ////`TextField`
          Expanded(
            child: TextFormField(
              decoration: _inputDecoration,
              controller: _messageController,
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty)
                    _sendButton = true;
                  else
                    _sendButton = false;
                });
              },
            ),
          ),
          if (_sendButton)
            IconButton(
              tooltip: "send message",
              icon: Icon(
                Icons.send,
                color: Colors.blue,
              ),
              onPressed: _sendMessage,
            ),
        ],
      ),
    );
  }

  ///extra actions for images, camera, voice
  Row actionButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            tooltip: "open camera & share image",
            icon: Icon(
              Icons.camera_alt,
              color: Colors.blue,
            ),
            onPressed: () {}),
        IconButton(
            tooltip: "send image",
            icon: Icon(
              Icons.photo,
              color: Colors.blue,
            ),
            onPressed: () {}),
        IconButton(
            tooltip: "voice message",
            icon: Icon(
              Icons.mic,
              color: Colors.blue,
            ),
            onPressed: () {}),
      ],
    );
  }
}
