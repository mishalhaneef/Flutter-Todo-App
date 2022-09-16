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
                    color: value == 0
                        ? state.switchValue
                            ? Constants.selectedBottomNavColorDark
                            : Constants.selectedBottomNavColor
                        : state.switchValue
                            ? Constants.unSelectedBottomNavColorDark
                            : Constants.unSelectedBottomNavColor,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    image: const AssetImage(Constants.completedTodo),
                    height: 35,
                    color: value == 1
                        ? state.switchValue
                            ? Constants.selectedBottomNavColorDark
                            : Constants.selectedBottomNavColor
                        : state.switchValue
                            ? Constants.unSelectedBottomNavColorDark
                            : Constants.unSelectedBottomNavColor,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    image: const AssetImage(Constants.favTodo),
                    height: 35,
                    color: value == 2
                        ? state.switchValue
                            ? Constants.selectedBottomNavColorDark
                            : Constants.selectedBottomNavColor
                        : state.switchValue
                            ? Constants.unSelectedBottomNavColorDark
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
        );
      },
      valueListenable: selectedIndexNotifier,
    );
  }
}
