import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  final Widget? child;
  final double? width;
  final bool? isBorder;
  final Color? bgColor;
  final Color? borderColor;
  final Function? onClick;

  CustomLogo({
    this.child,
    this.width,
    this.isBorder,
    this.borderColor,
    this.bgColor,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick as void Function()?,
      child: Container(
        width: width ?? 55,
        height: width ?? 55,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,
          border: Border.all(
            width: isBorder! ? 2 : 0,
            color: isBorder! ? borderColor ?? Colors.blue : Colors.transparent,
          ),
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: child,
        ),
      ),
    );
  }
}
