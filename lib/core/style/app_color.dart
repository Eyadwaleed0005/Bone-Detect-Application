import 'package:flutter/material.dart';

class ColorPalette {
  // Base
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Main Blue Shades
  static const Color lightBlue = Color(0xFF2E81DD);
  static const Color darkBlue = Color(0xFF225B9F);

  // Greys
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey600 = Color(0xFF757575);

  // Borders
  static const Color borderGrey = grey300;
  static const Color borderRed = Color(0xFFE53935);

  // Error Text
  static const Color errorRed = Color(0xFFD32F2F);

  // Gradient Background
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [lightBlue, darkBlue],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
