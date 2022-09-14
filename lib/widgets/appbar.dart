import 'package:bloc_change_text/presentation/home/add_todo_screen.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            showAddTodoPopup(context);
          },
          icon: const Icon(Icons.add),
        ),
        const SizedBox(width: 20)
      ],
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      elevation: 0,
    );
  }
}
