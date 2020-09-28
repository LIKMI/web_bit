import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

ThemeData get bluTheme => ThemeData(
    fontFamily: 'Proxima Nova',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.blue[800],
    accentColor: Colors.blueAccent[400],
    backgroundColor: Color(0xFFFCFCFF),
    scaffoldBackgroundColor: Color(0xFFFCFCFF),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          fontFamily: 'Proxima Nova',
          color: Color(0xFF1E2D3B),
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.blueAccent[400],
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIT LIKMI',
      theme: bluTheme,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'BIT LIKMI',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              Text(
                'Coming soon! 🤞',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
