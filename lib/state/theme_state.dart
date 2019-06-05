import 'package:flutter/material.dart';

class ThemeState with ChangeNotifier {
  ThemeData darkHackerNewsTheme = ThemeData.dark();

  ThemeData hackerNewsTheme = ThemeData(
    primaryColor: Color(0xFFF6F6EF), //#F6F6EF
    canvasColor: Color(0xffff6600),
    accentColor: Color(0xff843c0b),
    scaffoldBackgroundColor: Color(0xffff6f6ef).withOpacity(0.9),
  );

  ThemeData _themeData;
  bool isDark = false;

  ThemeState() {
    _themeData = hackerNewsTheme;
  }

  ThemeData getTheme() => _themeData;

  setTheme() {
    if (!isDark) {
      _themeData = darkHackerNewsTheme;
    } else {
      _themeData = hackerNewsTheme;
    }

    isDark = !isDark;
    notifyListeners();
  }
}
