import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Color(0xffEBF3F9),
  primaryColor: Color(0xff69C4FF),
  hintColor: Color(0xffb3b3b3),
  canvasColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
  ),
  textTheme: TextTheme(
    labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 18,
        letterSpacing: 2,
        fontWeight: FontWeight.w700),
    bodyLarge: TextStyle(),
    titleMedium: TextStyle(),
    titleLarge: TextStyle(),
    bodyMedium: TextStyle(),
  ),
  colorScheme: ColorScheme.fromSwatch(backgroundColor: Colors.white),
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// titleLarge    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyMedium)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
