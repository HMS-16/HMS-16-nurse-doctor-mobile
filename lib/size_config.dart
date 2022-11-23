import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getProportionateScreenHeigh(double inputHeight) {
  double ScreenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * ScreenHeight;
}

double getProportionateScreenWidth(double inputHeight) {
  double ScreenWidth = SizeConfig.screenHeight;
  return (inputHeight / 375.0) * ScreenWidth;
}
