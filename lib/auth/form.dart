import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthForm extends StatelessWidget {
  final isLog = false;

  final emailTextField = TextFormField(
    cursorColor: Colors.green,
    key: ValueKey('password'),

    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(15),
      prefixIcon: Icon(Icons.keyboard_hide),
      border: InputBorder.none,
      // fillColor: Colors.white.withOpacity(.7),
      // filled: true,
      hintText: 'Email',
    ),
  );

  final pasTextField = TextFormField(
    cursorColor: Colors.green,
    key: ValueKey('password'),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(15),
      prefixIcon: Icon(Icons.keyboard_hide),
      border: InputBorder.none,
      // fillColor: Colors.white.withOpacity(.7),
      // filled: true,
      hintText: '1234',
    ),
    obscureText: true,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLog ? "Login" : "SignUp",
          style: GoogleFonts.aladin(
              letterSpacing: 5,
              fontSize: Theme.of(context).textTheme.headline3.fontSize,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        emailTextField,
        pasTextField,
      ],
    );
  }
}
