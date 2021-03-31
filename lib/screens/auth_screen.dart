import 'package:flutter/material.dart';
import 'package:web_rtc/auth/components/background.dart';
import 'package:web_rtc/auth/form.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key key}) : super(key: key);

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
          AuthForm(),
        ],
      ),
    );
  }
}
