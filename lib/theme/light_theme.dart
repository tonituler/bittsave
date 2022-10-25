import 'package:flutter/material.dart';
import 'package:six_cash/util/color_resources.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Montserrat',
  primaryColor: Color(0xFF950035),
  secondaryHeaderColor: Color.fromARGB(255, 176, 73, 109),
  highlightColor: Color(0xFF950035).withOpacity(0.2),
  backgroundColor: Colors.white,
  splashColor: Color(0xFF950035).withOpacity(0.2),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: ColorResources.themeLightBackgroundColor,
  ),
);
