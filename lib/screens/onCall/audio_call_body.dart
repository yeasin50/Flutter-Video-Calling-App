import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_rtc/components/utils.dart';
import 'package:web_rtc/config/size.dart';
import 'package:web_rtc/screens/conversationsScreen/components/custom_logo.dart';

import 'components_/action_buttons.dart';

class AudioCallBody extends StatefulWidget {
  @override
  _AudioCallBodyState createState() => _AudioCallBodyState();
}

class _AudioCallBodyState extends State<AudioCallBody> {
  ///TODO:: pass from Before -1 in constructor
  String _receiverName = "Amigo as Amo";
  String _avatarUrl = 'assets/images/yeasin.jpg';

  String _duration = "connection....";
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    var sec = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _duration = Utils.stringDuration(Duration(seconds: sec += 1));
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///Logo + name+ status
        LayoutBuilder(
          builder: (context, constraints) => Align(
            alignment: Alignment(0, -.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomLogo(
                  child: Image.asset(
                    _avatarUrl,
                    fit: BoxFit.cover,
                  ),
                  isBorder: true,
                  width: constraints.maxWidth * .3,
                ),
                //name
                SizedBox(
                  height: 10,
                ),
                Text(
                  _receiverName,
                  style: GoogleFonts.adamina(
                    fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                ///`Duration`
                buildDuration(context)
              ],
            ),
          ),
        ),

        ///`action buttons`
        CallActionButtons(),
      ],
    );
  }

  Container buildDuration(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        _duration,
        style: GoogleFonts.lateef(
          color: Colors.white.withOpacity(.9),
          fontSize: Theme.of(context).textTheme.headline5!.fontSize,
          letterSpacing: 2,
          // height: 1.5,
          fontWeight: FontWeight.w800,
          // background: Paint()
          //   ..color = Colors.black26
          //   ..style = PaintingStyle.fill,
        ),
      ),
    );
  }
}
