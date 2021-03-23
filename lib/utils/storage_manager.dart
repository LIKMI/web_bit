import 'package:shared_preferences/shared_preferences.dart';

/// StoreManager class
/// 
/// Note: Provide function to manage user preferences using shared_preferences
class StorageManager {

  /// Save data to shared preferences and filter type 
  ///  
  /// @param String key
  /// @param dynamic value
  static void saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      print("Invalid Type");
    }
  }

  /// Read data from shared preferences
  ///  
  /// @param String key
  /// @return dynamic obj
  static Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj;
  }

  /// Static 
  ///  
  /// @param String stringThemeMode
  /// @return ThemeMode instance
  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}