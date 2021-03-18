import 'package:flutter/material.dart';

// Name of the application
const String websiteTitle = 'WEB-BIT';

// Title Home
const String homeTitle = 'BIT-LIKMI';

/// Title Text Style
TextStyle get titleTextStyle => TextStyle(
      color: Colors.blueGrey,
      fontSize: 20,
      fontFamily: 'Proxima Nova',
      fontWeight: FontWeight.w600,
      letterSpacing: 3,
    );

// Light Theme
ThemeData get lightTheme => ThemeData(
    primarySwatch: Colors.blueGrey,
    backgroundColor: Colors.white,
    cardColor: Colors.blueGrey[50],
    primaryTextTheme: TextTheme(
      button: TextStyle(
        color: Colors.blueGrey,
        decorationColor: Colors.blueGrey[300],
      ),
      subtitle2: TextStyle(
        color: Colors.blueGrey[900],
      ),
      subtitle1: TextStyle(
        color: Colors.black,
      ),
      headline1: TextStyle(color: Colors.blueGrey[800]),
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      selectedColor: Colors.white,
      color: Colors.blueGrey[100],
      fillColor: Colors.white24,
      splashColor: Colors.transparent,
    ),
    bottomAppBarColor: Colors.blueGrey[900],
    iconTheme: IconThemeData(color: Colors.blueGrey));

// Dark Theme
ThemeData get darkTheme => ThemeData(
      primarySwatch: Colors.blueGrey,
      backgroundColor: Colors.blueGrey[900],
      cardColor: Colors.black,
      primaryTextTheme: TextTheme(
        button: TextStyle(
          color: Colors.blueGrey[200],
          decorationColor: Colors.blueGrey[50],
        ),
        subtitle2: TextStyle(
          color: Colors.white,
        ),
        subtitle1: TextStyle(
          color: Colors.blueGrey[300],
        ),
        headline1: TextStyle(
          color: Colors.white70,
        ),
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: Colors.white,
        color: Colors.blueGrey[100],
        fillColor: Colors.white24,
        splashColor: Colors.transparent,
      ),
      bottomAppBarColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.blueGrey[200]),
    );
