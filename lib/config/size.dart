import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;
  static late double bodyText1;
  static late double subtitle1;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    bodyText1 = Theme.of(context).textTheme.bodyText1!.fontSize!;
    subtitle1 =  Theme.of(context).textTheme.subtitle1!.fontSize!;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 896 is the layout height that designer use
  // or you can say iPhone 11
  return (inputHeight / 896.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 414 is the layout width that designer use
  return (inputWidth / 414.0) * screenWidth;
}
