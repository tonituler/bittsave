import 'package:flutter/material.dart';
import 'package:bittsave/util/color_resources.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: Color(0xFF950035),
  brightness: Brightness.dark,
  secondaryHeaderColor: Color.fromARGB(255, 176, 73, 109),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: ColorResources.themeDarkBackgroundColor,
  ),
);
