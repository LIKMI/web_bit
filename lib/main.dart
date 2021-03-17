import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_bit/utils/authentication.dart';
import 'package:web_bit/utils/storage_manager.dart';
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
    await getUser();
    setState(() {});
    print('uid: $uid');
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
    // return Consumer(
    //   builder: (context, watch, child) {
    //     final themeModeNotifier = watch(themeModeProvider);
    //     return MaterialApp(
    //       title: 'BIT-LIKMI',
    //       theme: themeModeNotifier.getTheme(),
    //       darkTheme: darkTheme,
    //       debugShowCheckedModeBanner: false,
    //       home: HomePage(),
    //     );
    //   },
    // );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder(
  //       future: _lightF,
  //       builder: (context, snapshot) {
  //         return MaterialApp(
  //           theme: _light ? _lightTheme : _darkTheme,
  //           title: 'Material Apps',
  //           home: Scaffold(
  //             appBar: AppBar(
  //               title: Text('wawaw'),
  //             ),
  //             body: Center(
  //               child: Switch(
  //                   value: _light,
  //                   onChanged: (state) {
  //                     setState(() {
  //                       _light = state;
  //                     });
  //                     _saveTheme();
  //                   }),
  //             ),
  //           ),
  //         );
  //       });
  // }
}
