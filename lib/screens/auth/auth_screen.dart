import 'package:flutter/material.dart';
import 'package:web_rtc/components/background.dart';
import 'body_form.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = "/authScreen";
  
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Background(),
          SafeArea(
            child: AuthForm(),
          ),
        ],
      ),
    );
  }
}
