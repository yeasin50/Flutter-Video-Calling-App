import 'package:flutter/material.dart';

import 'components/row_message.dart';

class MessageList extends StatelessWidget {
  final String photUrl = "assets/images/yeasin.jpg";
  final bool isMe = false;

  ///TODO:: make a list of msg, then based on moduls assign
  final List<String> _list = [
    "Hey, how are you?",
    "fine, how about you?",
    "same, here",
    "I think, i saw you today",
    "where?",
    "it was there , from here and there but near, btw not here but somewhere."
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) => RowMessage(
          isMe: index % 2 == 0,
          msg: _list[index],
          photUrl: photUrl,
        ),
      ),
    );
  }
}
