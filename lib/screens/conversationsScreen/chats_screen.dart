import 'package:flutter/material.dart';

import 'body.dart';

class ConversationListScreen extends StatelessWidget {
  static const String routeName = "/ConversationListScreen";
  ConversationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //backgound
          SafeArea(
            child: BodyChatsScreen(),
          ),
        ],
      ),
    );
  }
}
