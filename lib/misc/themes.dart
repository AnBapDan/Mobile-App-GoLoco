// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themes() {
  return ThemeData(
    //Scaffold colors
    scaffoldBackgroundColor: Colors.black,
    splashColor: Colors.black,
    backgroundColor: Colors.black,
    highlightColor: Colors.transparent,
    //AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),

    //Buttons themes
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
            color: Color.fromARGB(255, 0, 128, 255),
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: Alignment.centerLeft,
        backgroundColor: Color.fromARGB(255, 23, 35, 49), //fundo
        foregroundColor: Color.fromARGB(255, 11, 132, 253), //texto
        shadowColor: Colors.transparent,
        textStyle: TextStyle(
            color: Color.fromARGB(255, 0, 128, 255),
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold),
        padding: EdgeInsets.all(5),
      ),
    ),

    //Text themes
    textTheme: GoogleFonts.ubuntuTextTheme(
      TextTheme(
        headline1: TextStyle(
            color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
        headline2: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        headline3: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        subtitle1: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        subtitle2: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        bodyText1: TextStyle(color: Colors.white),
      ),
    ),
    indicatorColor: Colors.transparent,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

BoxDecoration containers(Color color) {
  return BoxDecoration(
    shape: BoxShape.rectangle,
    color: color,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30), topRight: Radius.circular(30)),
  );
}
