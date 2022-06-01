import 'package:flutter/material.dart';

//! Karanlık Modu (Renkler) / Dark Mode (Colors)
ThemeData darkTheme = ThemeData(
  backgroundColor: const Color.fromARGB(255, 44, 44, 44),
  primaryColor: const Color(0xFFFF6000),
  brightness: Brightness.dark,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  textTheme: const TextTheme(
    headline6: TextStyle(
      fontFamily: "NextPro",
      color: Color(0xFFFFFFFF),
      fontWeight: FontWeight.w700,
      fontSize: 22.0,
      letterSpacing: 1.0,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

