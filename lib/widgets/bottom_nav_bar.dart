
import 'package:bloc_change_text/core/constants.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.selectedIndexNotifier,
  }) : super(key: key);

  final ValueNotifier<int> selectedIndexNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, int value, _) {
        return BottomNavigationBar(
          currentIndex: value,
          backgroundColor: Colors.white,
          elevation: 100,
          items: [
            BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage(Constants.todoHome),
                height: 40,
                color: value == 0
                    ? Constants.selectedBottomNavColor
                    : Constants.unSelectedBottomNavColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage(Constants.completedTodo),
                height: 35,
                color: value == 1
                    ? Constants.selectedBottomNavColor
                    : Constants.unSelectedBottomNavColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage(Constants.favTodo),
                height: 35,
                color: value == 2
                    ? Constants.selectedBottomNavColor
                    : Constants.unSelectedBottomNavColor,
              ),
              label: '',
            ),
          ],
          onTap: (newIndex) {
            selectedIndexNotifier.value = newIndex;
          },
        );
      },
      valueListenable: selectedIndexNotifier,
    );
  }
}
