import 'package:flutter/material.dart';

class ActiveDotOnLogo extends StatelessWidget {
  final Widget? child;
  final double? width;

  const ActiveDotOnLogo({Key? key, this.child, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 55,
      height: width ?? 55,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.blueAccent.withOpacity(.5),
        ),
        shape: BoxShape.circle,
      ),
      child: Stack(children: [
        Center(child: child),
        Align(
          alignment: Alignment(.8, .80),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
        )
      ]),
    );
  }
}
