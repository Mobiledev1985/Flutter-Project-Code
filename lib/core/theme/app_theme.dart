import 'package:flutter/material.dart';
import 'package:flutter_demo_project/core/theme/color_palette.dart';

mixin AppTheme {
  ThemeData lightTheme() => ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: ColorPalette.primaryColor,
          secondary: ColorPalette.secondaryColor,
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: ColorPalette.blackColor, fontSize: 12),
          bodyMedium: TextStyle(color: ColorPalette.blackColor, fontSize: 14),
          bodyLarge: TextStyle(color: ColorPalette.blackColor, fontSize: 16),
          headlineSmall:
              TextStyle(color: ColorPalette.blackColor, fontSize: 18),
          headlineMedium:
              TextStyle(color: ColorPalette.blackColor, fontSize: 20),
          headlineLarge:
              TextStyle(color: ColorPalette.blackColor, fontSize: 22),
          displaySmall: TextStyle(color: ColorPalette.blackColor, fontSize: 24),
          displayMedium:
              TextStyle(color: ColorPalette.blackColor, fontSize: 26),
          displayLarge: TextStyle(color: ColorPalette.blackColor, fontSize: 28),
        ),
      );

  ThemeData darkTheme() => ThemeData(colorScheme: const ColorScheme.dark());
}
