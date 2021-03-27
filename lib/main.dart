import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_bit/providers/providers_global.dart';
import 'package:web_bit/utils/authentication.dart';
import 'package:web_bit/utils/theme_data.dart';
import 'package:web_bit/utils/theme_manager.dart';

import 'screens/main_screen.dart';

void main() async {
  // Preload first launch theme data before attach to screen
  await getTheme();
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
      title: 'BIT LIKMI',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).bottomAppBarColor;
    final textTheme = Theme.of(context).textTheme;
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: themeData,
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: FlutterLogo(size: screenSize.height / 5),
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('created by', style: textTheme.bodyText1),
                    ),
                  ),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('BIT-LIKMI', style: textTheme.headline1),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
