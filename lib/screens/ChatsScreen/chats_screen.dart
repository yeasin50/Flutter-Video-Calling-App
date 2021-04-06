import 'package:flutter/material.dart';

import 'body.dart';

class OpenningScreen extends StatelessWidget {
  OpenningScreen({Key key}) : super(key: key);

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
