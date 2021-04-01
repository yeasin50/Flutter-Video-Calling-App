import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_rtc/config/color_const.dart';

class RoundedButton extends StatelessWidget {
  final String labelText;
  final double width;
  final Function onPress;

  const RoundedButton({Key key, this.labelText, this.width, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        width: width ?? 300,
        height: Theme.of(context).buttonTheme.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          labelText,
          style: GoogleFonts.lato(
            fontSize: Theme.of(context).textTheme.headline6.fontSize - 4,
            color: kbgBLrimaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
