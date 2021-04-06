import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  final Widget child;
  final double width;
  final bool isActive;
  final Color bgColor;
  final Color borderColor;
  final Function onClick;

  CustomLogo({
    this.child,
    this.width,
    this.isActive,
    this.borderColor,
    this.bgColor,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: width ?? 55,
        height: width ?? 55,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,
          border: Border.all(
            width: isActive ? 2 : 0,
            color: borderColor ?? Colors.blue,
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
