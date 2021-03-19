import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_bit/providers/providers_global.dart';
import 'package:web_bit/utils/authentication.dart';
import 'package:web_bit/utils/theme_data.dart';
import 'package:web_bit/utils/theme_manager.dart';

import 'screens/home_page.dart';

void main() {
  // Preload data on first launch
  getTheme();
  runApp(
    // Enable riverpod provider 
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  Future getUserInfo() async {
    await getUser();
    print('uid: $uid');
    print('theme: $currentTheme');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MainWidget();
  }
}

class MainWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    // Watch theme changes
    final ThemeMode themeMode = watch(themeModeProvider).state;
    // Save theme when rebuild or change theme
    saveTheme(themeMode);

    return MaterialApp(
      title: 'BIT-LIKMI',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}