import 'package:flutter/material.dart';
import 'package:web_bit/utils/authentication.dart';
import 'package:web_bit/utils/theme/theme_data.dart';
import 'package:web_bit/utils/theme_manager.dart';

import 'screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getTheme();
    getUserInfo();
    super.initState();
  }

  Future getUserInfo() async {
    await getTheme();
    print('dark mode: $light');
    await getUser();
    print('uid: $uid');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: lightF,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'BIT-LIKMI',
            theme: light ? darkTheme : lightTheme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        });
  }
}
