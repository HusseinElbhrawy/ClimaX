import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  static Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    themeNotifier.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  static Future<void> toggleTheme() async {
    themeNotifier.value = themeNotifier.value == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', themeNotifier.value == ThemeMode.dark);
  }
}
