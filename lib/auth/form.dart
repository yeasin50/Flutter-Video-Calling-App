import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/rounded_button.dart';
import 'components/social_icon.dart';

class AuthForm extends StatelessWidget {
  final isLogin = true;
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
        passwordTextField("Password"),
        if (!isLogin) passwordTextField("Confirm Password"),
        loginORsignupButton(),
        orDivider(),
        SizedBox(
          height: 10,
        ),
        socialIcons()
      ],
    );
  }

  Padding loginORsignupButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RoundedButton(
        labelText: isLogin ? "login" : "Signup",
        onPress: () {
          print(isLogin ? "login" : "Signup");
        },
      ),
    );
  }

  Widget socialIcons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
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
      ),
    );
  }

  LayoutBuilder orDivider() {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
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

  InputDecoration inputDecoration(
    String hint,
    IconData prefix,
  ) {
    var suffix = Icon(
      Icons.nat,
      color: Colors.transparent,
    );
    if (hint.contains("Password"))
      suffix = Icon(
        Icons.visibility,
        color: Colors.white.withOpacity(.8),
      );

    return InputDecoration(
      labelText: hint,
      labelStyle: TextStyle(
        color: Colors.white.withOpacity(.7),
      ),
      prefixIcon: Icon(
        prefix,
        color: Colors.white,
      ),
      suffixIcon: suffix,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.white,
          width: 2,
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

  Widget passwordTextField(
    String hint,
  ) {
    InputDecoration _decoration = inputDecoration(
      hint,
      Icons.ac_unit,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: Colors.green,
        key: ValueKey(hint),
        decoration: _decoration,
      ),
    );
  }

  Widget emailTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: Colors.green,
        key: ValueKey('email'),
        decoration: inputDecoration(
          "Email",
          Icons.email,
        ),
      ),
    );
  }

  Text title(BuildContext context) {
    return Text(
      isLogin ? "Login" : "SignUp",
      style: GoogleFonts.aladin(
          letterSpacing: 5,
          fontSize: Theme.of(context).textTheme.headline3.fontSize,
          fontWeight: FontWeight.w600,
          color: Colors.white),
    );
  }
}
