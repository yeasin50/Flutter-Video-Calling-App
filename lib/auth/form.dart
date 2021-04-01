import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_rtc/config/color_const.dart';

import 'components/rounded_button.dart';
import 'components/social_icon.dart';

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
        SizedBox(
          height: 16,
        ),
        RoundedButton(
          labelText: isLog ? "login" : "Signup",
          onPress: () {
            print(isLog ? "login" : "Signup");
          },
        ),
        SizedBox(
          height: 20,
        ),
        orDivider(),
        SizedBox(
          height: 10,
        ),
        socialIcons()
      ],
    );
  }

  Row socialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIcon(
          iconSrc: Icon(
            Icons.ac_unit,
            size: 44,
          ),
          press: () {
            print("clicked");
          },
          label: "facebook",
        ),
        SocialIcon(
          iconSrc: Icon(
            Icons.access_alarm,
            size: 44,
          ),
          press: () {
            print("clicked2");
          },
          label: "Google",
        ),
        SocialIcon(
          iconSrc: Icon(
            Icons.celebration,
            size: 44,
          ),
          press: () {
            print("clicked3");
          },
          label: "Twitter",
        ),
      ],
    );
  }

  LayoutBuilder orDivider() {
    return LayoutBuilder(
      builder: (context, constraints) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildDivider(),
          // buildProgressDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: GoogleFonts.cabin(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          buildDivider(),
          // Expanded(
          //   child: RotatedBox(
          //     quarterTurns: 2,
          //     child: buildProgressDivider(),
          //   ),
          // ),
        ],
      ),
    );
  }

  Expanded buildProgressDivider() {
    return Expanded(
        child: LinearProgressIndicator(
      backgroundColor: Colors.red,
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.white,
      ),
    ));
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        height: 2,
        color: Colors.red,
      ),
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
