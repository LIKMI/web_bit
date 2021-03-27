import 'package:flutter/material.dart';
import 'package:web_bit/utils/custom_colors.dart';

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
          color: HEADER2_PRIMARY,
          fontSize: 25,
          fontWeight: FontWeight.w600,
          letterSpacing: 2,
        ),
        // Menu
        headline2: TextStyle(
          fontFamily: 'Proxima Nova',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: HEADER2_PRIMARY,
          decorationColor: MAIN_RED,
        ),
        // Button
        button: TextStyle(
          fontFamily: 'Proxima Nova',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          decorationColor: MAIN_RED,
        ),
        //Body Text 1
        bodyText1: TextStyle(
          fontFamily: 'Proxima Nova',
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: HEADER2_PRIMARY,
        ),
      ),
      // Toggle button
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: Colors.white,
        color: HEADER2_PRIMARY,
        fillColor: MAIN_RED,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      //Floating action button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white, backgroundColor: MAIN_RED),
      //Shadow color
      shadowColor: Colors.grey.withOpacity(0.4),
      //Statusbar and default element material
      primarySwatch: Colors.grey,
      //Background app
      backgroundColor: BACKGROUND_LIGHT,
      //Bottom appbar
      bottomAppBarColor: Colors.grey[50],
    );

// Dark Theme
ThemeData get darkTheme => ThemeData(
      textTheme: TextTheme(
        // Appbar Title
        headline1: TextStyle(
          fontFamily: 'Proxima Nova',
          color: WHITE,
          fontSize: 25,
          fontWeight: FontWeight.w600,
          letterSpacing: 2,
        ),
        // Menu
        headline2: TextStyle(
          fontFamily: 'Proxima Nova',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          decorationColor: MAIN_RED,
        ),
        // Button
        button: TextStyle(
          fontFamily: 'Proxima Nova',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          decorationColor: MAIN_RED,
        ),
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
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey[900],
      ),
      //Shadow color
      shadowColor: Colors.black87,
      //Statusbar and default element material
      primarySwatch: Colors.grey,
      //Background app
      backgroundColor: Colors.blueGrey,
      //Bottom appbar
      bottomAppBarColor: Colors.blueGrey[900],
    );
