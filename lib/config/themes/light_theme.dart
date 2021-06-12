import 'package:flutter/material.dart';

final themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Color(0xFF1D1C39),
  primaryColorLight: Color(0xFF464363),
  primaryColorDark: Color(0xFF000014),
  accentColor: Color(0xFFFF22B1),
  dividerColor: Color(0xFFCDCDCD),
  buttonTheme: ButtonThemeData(height: 65),
  iconTheme: IconThemeData(color: Colors.black, size: 24),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color(0xFFFF22B1),
    selectionColor: Color(0xFFFF22B1).withOpacity(0.5),
    selectionHandleColor: Color(0xFFFF22B1),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Color(0xFF1D1C39),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFFCDCDCD),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFFFF22B1),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Color(0xFFFF22B1),
      textStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.75,
      ),
      minimumSize: Size(0, 60),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Color(0xFF1D1C39),
      textStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      minimumSize: Size(60, 60),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateColor.resolveWith((states) {
      return Color(0xFF1D1C39);
    }),
    checkColor: MaterialStateColor.resolveWith((states) {
      return Color(0xFF1D1C39);
    }),
  ),
  fontFamily: 'Montserrat',
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 96.0,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    headline2: TextStyle(
      fontSize: 60.0,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
    ),
    headline3: TextStyle(
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
    ),
    headline4: TextStyle(
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    headline5: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
    ),
    headline6: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    subtitle2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.10,
    ),
    bodyText1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    button: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.75,
    ),
    caption: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    overline: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  ),
);
