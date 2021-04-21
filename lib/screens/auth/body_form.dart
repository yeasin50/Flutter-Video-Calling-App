import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_rtc/components/rounded_button.dart';
import 'package:web_rtc/components/round_icon.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm>
    with SingleTickerProviderStateMixin {
  var isLogin = true;
  bool _onAlreadyAccTapped = false;
  bool _passVisibility = true;
  bool _confPassVisibility = true;

  final textFieldContainerDecoration = BoxDecoration(
      border: Border.all(
        width: 3,
        color: Colors.pink,

        ///later gradient
      ),
      borderRadius: BorderRadius.circular(20));

  ///FIXME:: controller animation
  //////confirm password animation
  double _animContWidth = 0;

  _switchLogin() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          title(context),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              // height: constraints.maxHeight * .47,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  emailTextField(),
                  passwordTextField("Password"),
                  if (!isLogin) confPasswordTextField("Confirm Password"),
                  loginORsignupButton(),
                  orDivider(),
                  alreadyHaveanAccount(),
                  SizedBox(
                    height: 10,
                  ),
                  // socialIcons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget alreadyHaveanAccount() {
    return Align(
      alignment: Alignment(0, .81),
      child: GestureDetector(
        onTapDown: (details) {
          setState(() => _onAlreadyAccTapped = true);
        },
        onTapUp: (_) => setState(() => _onAlreadyAccTapped = false),
        onTap: _switchLogin,
        child: EasyRichText(
          isLogin
              ? "Don't have an Account? Sign up"
              : "Already have an Account? Login",
          defaultStyle: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.white.withOpacity(.8),
              backgroundColor: _onAlreadyAccTapped
                  ? Colors.white.withOpacity(.5)
                  : Colors.transparent,
            ),
          ),
          patternList: [
            EasyRichTextPattern(
              targetString: "Sign up",
              style: GoogleFonts.cabin(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            EasyRichTextPattern(
              targetString: "Login",
              style: GoogleFonts.cabin(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
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
          RoundIcon(
            child: Icon(
              Icons.ac_unit,
              size: 44,
            ),
            press: () {
              print("clicked");
            },
            label: "facebook",
          ),
          RoundIcon(
            child: Icon(
              Icons.access_alarm,
              size: 44,
            ),
            press: () {
              print("clicked2");
            },
            label: "Google",
          ),
          RoundIcon(
            child: Icon(
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
    return InputDecoration(
      contentPadding: EdgeInsets.all(12),
      labelText: hint,
      labelStyle: TextStyle(
        color: Colors.white.withOpacity(.7),
      ),
      prefixIcon: Icon(
        prefix,
        color: Colors.white,
      ),
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

  /// maybe separete 2 coz we wanna implement animation
  Widget passwordTextField(
    String hint,
  ) {
    InputDecoration _decoration = inputDecoration(
      hint,
      Icons.ac_unit,
    );

    _decoration = _decoration.copyWith(
      suffix: GestureDetector(
        onTap: () => setState(
          () => _passVisibility = !_passVisibility,
        ),
        child: Icon(
          _passVisibility ? Icons.visibility : Icons.visibility_off_rounded,
          color: Colors.white.withOpacity(.8),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: _passVisibility ? true : false,
        cursorColor: Colors.green,
        key: ValueKey(hint),
        decoration: _decoration,
      ),
    );
  }

  Widget confPasswordTextField(
    String hint,
  ) {
    InputDecoration _decoration = inputDecoration(
      hint,
      Icons.ac_unit,
    );

    _decoration = _decoration.copyWith(
      suffix: GestureDetector(
        onTap: () => setState(
          () => _confPassVisibility = !_confPassVisibility,
        ),
        child: Icon(
          _confPassVisibility ? Icons.visibility : Icons.visibility_off_rounded,
          color: Colors.white.withOpacity(.8),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: _confPassVisibility ? true : false,
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

  Widget title(BuildContext context) {
    return Align(
      alignment: Alignment(0, -.8),
      child: Text(
        isLogin ? "Login" : "Sign up",
        style: GoogleFonts.aladin(
            letterSpacing: 5,
            fontSize: Theme.of(context).textTheme.headline3!.fontSize,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    );
  }
}
