import 'package:flutter/material.dart';
import 'package:web_bit/utils/storage_manager.dart';

late ThemeMode currentTheme;

saveTheme(ThemeMode themeMode) async {
  String currentTheme = _themeToString(themeMode);
  StorageManager.saveData('themeMode', currentTheme);
}

getTheme() async {
   StorageManager.readData('themeMode').then((value) {
      currentTheme = _stringToTheme(value);
    });
}

_themeToString(ThemeMode themeMode) {
  switch (themeMode) {
    case ThemeMode.light:
      return 'light';
    case ThemeMode.dark:
      return 'dark';
    default:
      return 'system';
  }
}

_stringToTheme(String stringThemeMode) {
  switch (stringThemeMode) {
    case 'light':
      return ThemeMode.light;
    case 'dark':
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}
