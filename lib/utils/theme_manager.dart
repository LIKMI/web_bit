import 'package:flutter/material.dart';
import 'package:web_bit/utils/storage_manager.dart';

/// Global Value
late ThemeMode currentTheme;

/// Save theme mode applied on rebuild main to user preference
///
/// @param ThemeMode themeMode
saveTheme(ThemeMode themeMode) async {
  String currentTheme = await _themeToString(themeMode);
  StorageManager.saveData('themeMode', currentTheme);
}

/// Async function to make request to read data user preference
getTheme() async {
  await StorageManager.readData('themeMode').then((value) {
    // get themes using string and return ThemeMode class
    currentTheme = _stringToTheme(value);
  });
}

/// Convert current ThemeMode into string to keep user preference
///
/// @param dynamic themeMode
/// @return String
_themeToString(themeMode) {
  switch (themeMode) {
    case ThemeMode.light:
      return 'light';
    case ThemeMode.dark:
      return 'dark';
    default:
      return 'system';
  }
}

/// Convert string from storage into ThemeMode class
///
/// @param dynamic stringThemeMode
/// @return ThemeMode instance
_stringToTheme(stringThemeMode) {
  // return default system if value not match
  switch (stringThemeMode) {
    case 'light':
      return ThemeMode.light;
    case 'dark':
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}
