import 'package:flutter/material.dart';

class AppTheme {
  static final Color _lightFocusColor = Colors.black.withValues(alpha: 0.12);
  static final Color _darkFocusColor = Colors.white.withValues(alpha: 0.12);

  static ThemeData _buildThemeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
    );
  }

  static final ThemeData lightTheme = _buildThemeData(
    _lightColorScheme,
    _lightFocusColor,
  );

  static final ThemeData darkTheme = _buildThemeData(
    _darkColorScheme,
    _darkFocusColor,
  );

  static const ColorScheme _lightColorScheme = ColorScheme(
    primary: Color(0xFF7867d9),
    onPrimary: Colors.black,
    secondary: Color(0xFFFD5135),
    onSecondary: Color(0xFF322942),
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Color(0xFFFAFBFB),
    onSurface: Color(0xFF23232d),
    primaryContainer: Color(0xffe7e7e7),
    onPrimaryContainer: Color(0xFF7F7F7F),
    brightness: Brightness.light,
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    primary: Color(0xFF7867d9),
    onPrimary: Colors.white,
    secondary: Color(0xFFFD5135),
    onSecondary: Colors.white,
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Color(0xff1f1f1f),
    onSurface: Colors.white,
    primaryContainer: Color(0xff2b2b2b),
    onPrimaryContainer: Color(0xFFA5A5A5),
    brightness: Brightness.dark,
  );
}

extension ThemeGetter on BuildContext {
  /// Extensions for accessing theme in the BuildContext
  ThemeData get theme => Theme.of(this);

  /// Extensions for accessing color scheme in the BuildContext
  ColorScheme get colorScheme => theme.colorScheme;
}
