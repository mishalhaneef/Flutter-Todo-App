import 'package:bloc_change_text/core/constants.dart';
import 'package:bloc_change_text/root_screen.dart';
import 'package:bloc_change_text/widgets/bin.dart';
import 'package:bloc_change_text/widgets/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../application/bloc_exports.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(29.0),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return ListView(
              children: [
                const DoItLogoWidget(),
                const SizedBox(height: 30),

                DrawerTile(
                  icon: Icons.task_alt_rounded,
                  name: 'My Task',
                  routeName: RootScreen.id,
                  count: state.allTasks.length.toString(),
                ),

                DrawerTile(
                  icon: Icons.delete,
                  name: 'Bin',
                  routeName: Bin.id,
                  count: state.removedTasks.length.toString(),
                ),
                // const Spacer(),
                CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: const Color.fromARGB(255, 231, 231, 231),
                  trackColor: Constants.addButtonColor,
                )
              ],
            );
          },
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
    required this.routeName,
    required this.count,
  }) : super(key: key);

  final IconData icon;
  final String name;
  final String routeName;
  final String count;

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
      trailing: Text(
        count,
        style: const TextStyle(
          color: Constants.addButtonColor,
        ),
      ),
      onTap: () {
        if (routeName == RootScreen.id) {
          Navigator.pop(context);
          // Navigator.of(context)
          //     .pushNamedAndRemoveUntil(routeName, (route) => false);
        } else {
          Navigator.of(context).pushNamed(routeName);
        }
      },
    );
  }
}
