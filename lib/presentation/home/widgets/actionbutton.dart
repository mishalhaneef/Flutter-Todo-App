import 'package:bloc_change_text/core/constants.dart';
import 'package:bloc_change_text/core/global.dart';
import 'package:bloc_change_text/infrastructure/guid_gen.dart';
import 'package:flutter/material.dart';

import '../../../application/bloc_exports.dart';
import '../../../core/enums.dart';
import '../../../domain/models/tasks.dart';

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
        if (type == ActionButtonType.cancel) {
          Navigator.pop(context);
        } else {
          addTask(context);
        }
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

addTask(BuildContext context) {
  Task task = Task(
    title: titleController.text,
    id: GUIDGen.generate()
  );
  // the event class wiill trigger when this code run. and this code
  // will run when the add button pressed with the required contents
  // and it will send a task object to the event
  context.read<TaskBloc>().add(AddTask(task: task));
  clearControllers();
  Navigator.pop(context);
}
