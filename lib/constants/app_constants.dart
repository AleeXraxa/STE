import 'package:flutter/material.dart';

class AppConstants {
  // Colors
  static const Color backgroundColor = Color(0xFF000000);
  static const Color primaryColor = Color(0xFF02403e);
  static const Color secondaryColor = Color(0xFF00356b);
  static const Color textColor = Color(0xFFFFFFFF);

  // Typography
  static const String fontFamily = 'Roboto';

  static TextTheme get textTheme => const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: textColor,
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: textColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: textColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: textColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: textColor,
    ),
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: textColor,
    ),
  );
}
