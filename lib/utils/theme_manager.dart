import 'package:flutter/material.dart';
import 'package:web_bit/utils/storage_manager.dart';
import 'package:web_bit/utils/theme/theme_data.dart';

bool light = true;
late Future<dynamic> lightF;

saveTheme() async {
  StorageManager.saveData('themeMode', light);
}

getTheme() async {
  lightF = StorageManager.readData('themeMode').then((value) {
    return value != null ? value : true;
  });
  light = await lightF;
}

class ThemeModeNotifier with ChangeNotifier {
  ThemeData _themeData = lightTheme;
  ThemeData getTheme() => _themeData;

  ThemeModeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';
      if (themeMode == 'dark') {
        _themeData = darkTheme;
      } else {
        _themeData = lightTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
