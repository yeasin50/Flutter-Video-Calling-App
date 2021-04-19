import 'package:flutter/material.dart';
import 'package:web_rtc/components/background.dart';

import 'audio_call_body.dart';
import 'body_on_video_call.dart';

class OnCallRunningScreen extends StatefulWidget {
  static const String routeName = "/onCallScreen";
  OnCallRunningScreen({Key? key}) : super(key: key);

  @override
  _OnCallRunningScreenState createState() => _OnCallRunningScreenState();
}

class _OnCallRunningScreenState extends State<OnCallRunningScreen> {
  bool audioCall = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
            child: audioCall ? AudioCallBody() : VideoCallBody(),
          ),
        ],
      ),
    );
  }
}
