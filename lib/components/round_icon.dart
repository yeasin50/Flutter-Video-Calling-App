import 'package:flutter/material.dart';

class RoundIcon extends StatelessWidget {
  final dynamic child;
  final String? label;
  final Color? background;
  final Function? press;

  const RoundIcon(
      {Key? key, this.child, this.background, this.label, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            decoration: BoxDecoration(
              color: background ?? Colors.transparent,
              border: Border.all(
                width: 2,
                color: background == null
                    ? background!.withOpacity(.6)
                    : Colors.white.withOpacity(.5),
              ),
              shape: BoxShape.circle,
            ),
            child: child,
          ),
          Text(label ?? ""),
        ],
      ),
    );
  }
}
