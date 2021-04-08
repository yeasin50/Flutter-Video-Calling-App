import 'package:flutter/material.dart';
import 'body.dart';


class ChattingScreen extends StatelessWidget {
  static const routeName = "/conversations/chatting";
  const ChattingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChatBody(),
      ),
    );
  }
}
