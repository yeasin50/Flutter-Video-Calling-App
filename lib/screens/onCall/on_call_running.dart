import 'package:flutter/material.dart';
import 'package:web_rtc/components/background.dart';

import 'body_on_call.dart';

class OnCallRunningScreen extends StatefulWidget {
  static const String routeName = "/onCallScreen";
  OnCallRunningScreen({Key? key}) : super(key: key);

  @override
  _OnCallRunningScreenState createState() => _OnCallRunningScreenState();
}

class _OnCallRunningScreenState extends State<OnCallRunningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(child: RunningCallBody()),
        ],
      ),
    );
  }
}
