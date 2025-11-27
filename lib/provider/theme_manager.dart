import 'package:flutter/material.dart';

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._internal();
  factory ThemeManager() => _instance;
  ThemeManager._internal();

  // Start with dark mode as default
  final ValueNotifier<bool> isDarkMode = ValueNotifier<bool>(true);

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  void setTheme(bool isDark) {
    isDarkMode.value = isDark;
  }

  ThemeMode get themeMode =>
      isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
}
