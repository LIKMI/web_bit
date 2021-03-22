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
      textTheme: TextTheme(
        // Appbar Title
        headline1: TextStyle(
          fontFamily: 'Proxima Nova',
          color: Colors.blueGrey,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 3,
        ),
        // Menu
        headline2: TextStyle(
            fontFamily: 'Proxima Nova',
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey,
            decorationColor: Colors.red),
        // Button
        button: TextStyle(
            fontFamily: 'Proxima Nova',
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            decorationColor: Colors.red),
        //Body Text 1
        bodyText1: TextStyle(
          fontFamily: 'Proxima Nova',
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: Colors.blueGrey,
        ),
      ),
      // Toggle button
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: Colors.white,
        color: Colors.blueGrey,
        fillColor: Colors.red,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      //Floating action button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.blueGrey, backgroundColor: Color(0xFFEBEBEB)),
      primarySwatch: Colors.red,
      backgroundColor: Colors.white,
      cardColor: Colors.blueGrey[50],
      primaryTextTheme: TextTheme(
        button: TextStyle(
          color: Colors.blueGrey,
          decorationColor: Colors.blueGrey[300],
        ),
        subtitle1: TextStyle(
          color: Colors.black,
          decorationColor: Colors.blue[200],
        ),
        headline1: TextStyle(color: Colors.blueGrey[800]),
      ),
      bottomAppBarColor: Color(0xFFEBEBEB),
      iconTheme: IconThemeData(color: Colors.blueGrey),
    );

// Dark Theme
ThemeData get darkTheme => ThemeData(
      textTheme: TextTheme(
        // Appbar Title
        headline1: TextStyle(
          fontFamily: 'Proxima Nova',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 3,
        ),
        // Menu
        headline2: TextStyle(
            fontFamily: 'Proxima Nova',
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            decorationColor: Colors.red),
        // Button
        button: TextStyle(
            fontFamily: 'Proxima Nova',
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            decorationColor: Colors.red),
        //Body Text 1
        bodyText1: TextStyle(
          fontFamily: 'Proxima Nova',
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      // Toggle button
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: Colors.white,
        color: Colors.blueGrey[100],
        fillColor: Colors.white24,
        splashColor: Colors.transparent,
        hoverColor: Colors.white24,
      ),
      //Floating action button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[900]),
      primarySwatch: Colors.blueGrey,
      backgroundColor: Colors.blueGrey,
      cardColor: Colors.blueGrey[50],
      primaryTextTheme: TextTheme(
        button: TextStyle(
          color: Colors.white,
          decorationColor: Colors.blueGrey[300],
        ),
        subtitle1: TextStyle(
          color: Colors.white,
          decorationColor: Colors.blue[200],
        ),
        headline1: TextStyle(color: Colors.blueGrey[800]),
      ),

      bottomAppBarColor: Colors.blueGrey[900],
      iconTheme: IconThemeData(color: Colors.blueGrey),
    );
