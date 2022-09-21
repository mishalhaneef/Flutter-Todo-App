import 'package:bloc_change_text/core/constants.dart';
import 'package:flutter/material.dart';

import '../application/bloc_exports.dart';

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
        return BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: value,
              backgroundColor: state.switchValue
                  ? Constants.appDarkThemeColor
                  : Colors.white,
              elevation: 100,
              items: [
                BottomNavigationBarItem(
                  icon: Image(
                      image: const AssetImage(Constants.todoHome),
                      height: 40,
                      color: navColor(state, value, 0)),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image(
                      image: const AssetImage(Constants.completedTodo),
                      height: 35,
                      color: navColor(state, value, 1)),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image(
                      image: const AssetImage(Constants.favTodo),
                      height: 35,
                      color: navColor(state, value, 2)),
                  label: '',
                ),
              ],
              onTap: (newIndex) {
                selectedIndexNotifier.value = newIndex;
              },
            );
          },
        );
      },
      valueListenable: selectedIndexNotifier,
    );
  }
}

Color navColor(SwitchState state, value, index) {
  if (value == index) {
    if (state.switchValue == true) {
      return Constants.selectedBottomNavColorDark;
    } else {
      return Constants.selectedBottomNavColor;
    }
  } else {
    if (state.switchValue) {
      return Constants.unSelectedBottomNavColorDark;
    } else {
      return Constants.unSelectedBottomNavColor;
    }
  }
}
