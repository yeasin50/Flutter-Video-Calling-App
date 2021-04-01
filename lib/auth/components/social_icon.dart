import 'package:flutter/material.dart';
import 'package:web_rtc/config/color_const.dart';

class SocialIcon extends StatelessWidget {
  final dynamic iconSrc;
  final String label;
  final Function press;

  const SocialIcon({Key key, this.iconSrc, this.label, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.white.withOpacity(.5),
              ),
              shape: BoxShape.circle,
            ),
            child: iconSrc,
          ),
          Text(label),
        ],
      ),
    );
  }
}
