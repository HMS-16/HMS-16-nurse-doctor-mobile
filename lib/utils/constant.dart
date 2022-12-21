import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Color
Color cIcon = const Color.fromRGBO(50, 50, 50, 1);
Color cBlackBase = const Color.fromRGBO(34, 34, 34, 1);
Color cBlackLighter = const Color.fromRGBO(61, 61, 61, 1);
Color cBlackLight = const Color.fromRGBO(46, 46, 46, 1);
Color cBlackLightest = const Color.fromRGBO(84, 84, 84, 1);
Color cWhiteBase = const Color.fromRGBO(253, 253, 253, 1);
Color cSecondaryLightest = const Color.fromRGBO(244, 248, 253, 1);
Color cWhiteDark = const Color(0xffF2F2F2);
Color cWhiteDarker = const Color.fromRGBO(227, 227, 227, 1);
Color cInfoLightest = const Color.fromRGBO(171, 227, 239, 1);
Color cInfoLight = const Color.fromRGBO(86, 200, 222, 1);
Color cPrimaryBase = const Color(0xff1153B5);
Color cSuccessBase = const Color.fromRGBO(41, 153, 29, 1);
Color cPrimaryLight = const Color(0xff608CCE);
Color cPrimaryDark = const Color(0xff0E4597);
Color cBlack = const Color(0xff000000);
Color cWhiteLast = const Color(0xff6D6D6D);
Color cRed = const Color(0xff9B1A1A);
Color cGreenLine = const Color(0xff14FF00);
Color cSuccessLightest = const Color(0xffB8DDB4);
Color cSuccessDark = const Color(0xff228018);
Color cSecondaryLighter = const Color(0xffE3ECFA);

TextStyle textStyle = GoogleFonts.nunito();

enum ActionState {
  none,
  loading,
  // error,
}