import 'package:bloc_change_text/core/constants.dart';
import 'package:bloc_change_text/core/enums.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      dividerColor: Colors.transparent,
      scaffoldBackgroundColor: Constants.appDarkThemeColor,
      appBarTheme: const AppBarTheme(color: Constants.appDarkThemeColor),
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF4483FF),
        foregroundColor: Color(0xFFD8DEFF),
      ),
      cardColor: const Color(0xFF1B1E2F),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey, unselectedItemColor: Colors.white),
    ),

    //
    //

    AppTheme.lightTheme: ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      dividerColor: Colors.transparent,
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Constants.appThemeColor,
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white),
    ),
  };
}
