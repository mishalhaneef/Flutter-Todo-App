import 'package:bloc_change_text/root_screen.dart';
import 'package:bloc_change_text/presentation/bin.dart';
import 'package:flutter/material.dart';

class AppRouters {
  Route? onGenerateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case RootScreen.id:
        return MaterialPageRoute(
          builder: (_) => const RootScreen(),
        );
      case Bin.id:
        return MaterialPageRoute(
          builder: (_) => const Bin(),
        );
      default:
        return null;
    }
  }
}
