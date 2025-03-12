import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme(bool isDark) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    final theme = ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xFFFFA828),
        secondary: Color(0xFFFFE894),
        brightness: brightness,
      ),
    );
    return theme;
  }
}
