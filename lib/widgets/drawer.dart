import 'package:bloc_change_text/core/constants.dart';
import 'package:bloc_change_text/widgets/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(29.0),
        child: ListView(
          children: [
            const DoItLogoWidget(),
            const SizedBox(height: 30),
            const DrawerTile(icon: Icons.task_alt_rounded, name: 'My Task'),
            const DrawerTile(icon: Icons.delete, name: 'Bin'),
            const Spacer(),
            CupertinoSwitch(
              value: true,
              onChanged: (value) {},
              activeColor: const Color.fromARGB(255, 231, 231, 231),
              trackColor: Constants.addButtonColor,
            )
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);

  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(name),
        ],
      ),
      onTap: () {},
    );
  }
}
