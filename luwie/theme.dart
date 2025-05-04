import 'package:flutter/material.dart';


const Color darkBlue  = Color(0xFF0A2D65);
const Color lightBlue = Color(0xFF52B0E7);
const Color accentRed = Color(0xFFD32F2F);

final ThemeData themeData = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: darkBlue,
    onPrimary: Colors.white,
    secondary: lightBlue,
    onSecondary: Colors.white,
    error: accentRed,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black87,
    surface: Colors.white,
    onSurface: Colors.black87,
  ),
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: darkBlue,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: accentRed,
      foregroundColor: Colors.white,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: lightBlue),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: darkBlue, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
