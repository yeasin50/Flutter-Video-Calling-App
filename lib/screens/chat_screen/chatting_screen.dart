import 'package:flutter/material.dart';
import 'package:web_rtc/config/size.dart';
import 'body.dart';

class ChattingScreen extends StatelessWidget {
  static const routeName = "/conversations/chatting";
  const ChattingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: ChatBody(),
      ),
    );
  }
}
