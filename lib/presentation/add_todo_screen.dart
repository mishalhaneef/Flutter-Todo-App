import 'package:bloc_change_text/core/constants.dart';
import 'package:flutter/material.dart';

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
                const TextFieldTodo(content: 'Title'),
                const SizedBox(height: 35),
                const TextFieldTodo(content: 'Description'),
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

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.type,
  }) : super(key: key);

  final ActionButtonType type;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        type == ActionButtonType.cancel ? Navigator.pop(context) : null;
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        backgroundColor: type == ActionButtonType.cancel
            ? MaterialStateProperty.all<Color>(Constants.cancelButtonColor)
            : MaterialStateProperty.all<Color>(Constants.addButtonColor),
      ),
      child: Text(type == ActionButtonType.add ? 'Add' : 'Cancel'),
    );
  }
}

class TextFieldTodo extends StatelessWidget {
  const TextFieldTodo({
    Key? key,
    required this.content,
  }) : super(key: key);
  final String content;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Row(
          children: [
            const SizedBox(width: 10),
            Text(
              content,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

enum ActionButtonType { add, cancel }
