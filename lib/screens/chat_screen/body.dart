import 'package:flutter/material.dart';

import 'components/header.dart';

class ChatBody extends StatefulWidget {
  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatAppBar(),
        Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
