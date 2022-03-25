import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class Themes {
  static final lightTheme = ThemeData(
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.black),
      ),
      hintColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.black,
        filled: true,
      ),
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange,
          fontSize: 20,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.deepOrange,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
      ));

  static final darkTheme = ThemeData(
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white),
      ),
      hintColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.black),
        fillColor: Colors.white,
        filled: true,
      ),
      backgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.orange,
          fontSize: 20,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.orange,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
      ));
}
