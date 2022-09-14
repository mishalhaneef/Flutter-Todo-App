import 'package:bloc_change_text/core/constants.dart';
import 'package:bloc_change_text/presentation/home/add_todo_screen.dart';
import 'package:bloc_change_text/presentation/completed/completed_task.dart';
import 'package:bloc_change_text/presentation/favourite/fav_todo.dart';
import 'package:bloc_change_text/presentation/home/homepage.dart';
import 'package:bloc_change_text/widgets/drawer.dart';
import 'package:flutter/material.dart';

import 'widgets/appbar.dart';
import 'widgets/bottom_nav_bar.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  static ValueNotifier<bool> switchNotifier = ValueNotifier(true);
  final _pages = const [
    HomePage(),
    CompletedTask(),
    FavouriteTodo(),
  ];

  static const id = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // common appbar widget
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(),
      ),
      // app's drawer
      drawer: const DrawerWidget(),
      backgroundColor: Colors.white,
      // root body
      body: ValueListenableBuilder(
        valueListenable: selectedIndexNotifier,
        builder: (BuildContext context, int updatedIndex, _) {
          return _pages[updatedIndex];
        },
      ),
      // to do add button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTodoPopup(context);
        },
        backgroundColor: Constants.appThemeColor,
        child: const Icon(Icons.add),
      ),
      // bottom nav bar button
      bottomNavigationBar:
          BottomNavBar(selectedIndexNotifier: selectedIndexNotifier),
    );
  }
}
