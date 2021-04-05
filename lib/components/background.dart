import 'package:flutter/material.dart';
import 'package:web_rtc/config/color_const.dart';

class Background extends StatefulWidget {
  Background({Key key}) : super(key: key);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            kbgTLTPrimaryColor,
            kbgBLrimaryColor,
          ])),
    );
  }
}
