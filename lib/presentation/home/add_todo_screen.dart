import 'package:bloc_change_text/core/enums.dart';
import 'package:bloc_change_text/core/global.dart';
import 'package:bloc_change_text/presentation/home/widgets/todo_textfield.dart';
import 'package:flutter/material.dart';

import 'widgets/actionbutton.dart';

Future<void> showAddTodoPopup(BuildContext context) async {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    context: context,
    builder: (ctx) {
      return SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text('Add Task', style: TextStyle(fontSize: 28)),
                const SizedBox(height: 35),
                TextFieldTodo(
                  content: 'Title',
                  controller: titleController,
                ),
                const SizedBox(height: 35),
                TextFieldTodo(
                  content: 'Description',
                  controller: descriptionController,
                ),
                const SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    ActionButton(type: ActionButtonType.cancel),
                    SizedBox(width: 15),
                    ActionButton(type: ActionButtonType.add)
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
