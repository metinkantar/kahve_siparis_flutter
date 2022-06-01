import 'package:flutter/material.dart';

//! Işık Modu (Renkler) / Light Mode (Colors)
ThemeData lightTheme = ThemeData(
  //backgroundColor: const Color.fromARGB(255, 209, 209, 209),
  backgroundColor: const Color(0xFFF2F2F2),
  primaryColor: const Color(0xFFFF6000),
  brightness: Brightness.light,
  /*   scaffoldBackgroundColor: Colors.white,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent, */
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontFamily: "NextPro",
      color: Color(0xFF000000),
      fontWeight: FontWeight.w700,
      fontSize: 22.0,
      letterSpacing: 1.0,
    ),
    headline6: TextStyle(
      fontFamily: "NextPro",
      color: Color(0xFFFF6000),
      fontWeight: FontWeight.w500,
      fontSize: 22.0,
      letterSpacing: 1.0,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

