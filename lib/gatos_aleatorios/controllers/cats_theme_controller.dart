import 'package:flutter/material.dart';

enum CatsThemeMode { system, light, dark }

class CatsThemeController extends ChangeNotifier {
  CatsThemeMode themeMode = CatsThemeMode.system;

  ThemeData getTheme(BuildContext context) {
    final systemBrightness = MediaQuery.platformBrightnessOf(context);
    final isDark = switch (themeMode) {
      CatsThemeMode.system => systemBrightness == Brightness.dark,
      CatsThemeMode.light => false,
      CatsThemeMode.dark => true,
    };
    return isDark ? _darkTheme : _lightTheme;
  }

  void setThemeMode(CatsThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }

  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue[200],
      foregroundColor: Colors.black87,
    ),
  );

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: ColorScheme.dark(primary: Colors.blue[300]!),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey[900],
      foregroundColor: Colors.white,
    ),
  );
}
