import 'package:flutter/material.dart';

/// when clicking more actions button>
///  - open the `actions row`, hide `send` button
///  - else close the `action panel`
///  ** `send icon color` depend on text field
///
class ChatFooter extends StatefulWidget {
  @override
  _ChatFooterState createState() => _ChatFooterState();
}

class _ChatFooterState extends State<ChatFooter> {
  bool _sendButton = false;
  bool _openMoreActions = false;

  /// textForm decoration
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              tooltip: "more",
              icon: Icon(
                _openMoreActions ? Icons.close : Icons.grid_view,
                color: Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  _openMoreActions = !_openMoreActions;
                });
              }),
          if (_openMoreActions) actionButton(),
          ////`TextField`
          Expanded(
            child: TextFormField(
              decoration: _inputDecoration,
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
              onPressed: () {},
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
