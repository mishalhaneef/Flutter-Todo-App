import 'package:flutter/material.dart';

class Constants {
  static const addButtonColor = Color(0xFF595959);
  static const cancelButtonColor = Color(0xFFBABABA);
  static const addButtonColorDark = Color(0xF64483FF);
  static const cancelButtonColorDark = Color(0xFF4C5483);

  // Bottom nav
  /// light theme
  static const selectedBottomNavColor = Color(0xFF222222);
  static const unSelectedBottomNavColor = Color(0xFFE2E5EF);

  /// dark theme
  static const selectedBottomNavColorDark = Color(0xFF4483FF);
  static const unSelectedBottomNavColorDark = Color(0xFF6A7097);

  static const appThemeColor = Color(0xFF222222);
  static const appDarkThemeColor = Color(0xFF111422);
  static const completedTodo = 'assets/completed_todo.png';
  static const favTodo = 'assets/fav_todo.png';
  static const todoHome = 'assets/task_home.png';

  static const headingTextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static const todoHead = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}
