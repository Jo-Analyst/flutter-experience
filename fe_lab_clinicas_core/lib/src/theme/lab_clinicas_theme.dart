import 'package:flutter/material.dart';

final class LabClinicasTheme {
  static const orangeColor = Color(0xFFFFAE45);
  static const lightorangeColor = Color(0xFFFFEFE9);
  static const blueColor = Color(0xFF01BDD6);
  static const lightGreyColor = Color(0xFFFFEFE9);

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: lightorangeColor),
  );

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: lightorangeColor),
    useMaterial3: true,
    fontFamily: 'Montserrat',
    scaffoldBackgroundColor: lightorangeColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightorangeColor,
      labelStyle: const TextStyle(
        fontSize: 14,
        color: orangeColor,
        fontWeight: FontWeight.w700,
      ),
      floatingLabelStyle:
          const TextStyle(color: blueColor, fontWeight: FontWeight.w600),
      enabledBorder: _defaultInputBorder,
      border: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        elevation: 8,
        backgroundColor: blueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(16),
        ),
        textStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w700),
      ),
    ),
  );

  static final darkTheme = lightTheme;

  static const titleStyle =
      TextStyle(color: blueColor, fontSize: 32, fontWeight: FontWeight.w900);
  static const titleSmallStyle =
      TextStyle(color: blueColor, fontSize: 18, fontWeight: FontWeight.w500);
  static const subtitleSmallStyle = TextStyle();
}
