import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthForm extends StatelessWidget {
  final isLog = false;
  final textFieldContainerDecoration = BoxDecoration(
      border: Border.all(
        width: 3,
        color: Colors.pink,

        ///later gradient
      ),
      borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        title(context),
        SizedBox(
          height: 20,
        ),
        emailTextField(),
        SizedBox(
          height: 10,
        ),
        passwordTextField(),
      ],
    );
  }

  InputDecoration inputDecoration(String hint, IconData prefix) {
    return InputDecoration(
      labelText: hint,
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      hintStyle: TextStyle(
        color: Colors.black,
      ),
      prefixIcon: Icon(
        prefix,
        color: Colors.white,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      cursorColor: Colors.green,
      key: ValueKey('password'),
      decoration: inputDecoration(
        "password",
        Icons.ac_unit,
      ),
    );
  }

  Widget emailTextField() {
    return TextFormField(
      cursorColor: Colors.green,
      key: ValueKey('email'),
      decoration: inputDecoration(
        "Email",
        Icons.email,
      ),
    );
  }

  Text title(BuildContext context) {
    return Text(
      isLog ? "Login" : "SignUp",
      style: GoogleFonts.aladin(
          letterSpacing: 5,
          fontSize: Theme.of(context).textTheme.headline3.fontSize,
          fontWeight: FontWeight.w600,
          color: Colors.white),
    );
  }
}
