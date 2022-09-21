import 'package:bloc_change_text/core/constants.dart';
import 'package:bloc_change_text/core/enums.dart';
import 'package:bloc_change_text/core/global.dart';
import 'package:bloc_change_text/domain/models/tasks.dart';
import 'package:bloc_change_text/infrastructure/guid_gen.dart';
import 'package:bloc_change_text/presentation/home/widgets/todo_textfield.dart';
import 'package:flutter/material.dart';

import '../../application/bloc_exports.dart';
import '../../infrastructure/day_fetch.dart';
import 'widgets/actionbutton.dart';

Future<void> showAddTodoPopup(
  BuildContext context, {
  PopupType type = PopupType.add,
  Task? oldTask,
}) async {
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
        child: BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context, state) {
            return Container(
              color: state.switchValue ? const Color(0xFF111422) : null,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(type == PopupType.add ? 'Add Task' : 'Edit Task',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 35),
                    TextFieldTodo(
                        content: 'Title',
                        controller: titleController,
                        color: state.switchValue
                            ? const Color(0xFF6A76B8)
                            : Colors.grey),
                    const SizedBox(height: 35),
                    TextFieldTodo(
                      content: 'Description',
                      controller: descriptionController,
                      color: state.switchValue
                          ? const Color(0xFF6A76B8)
                          : Colors.grey,
                    ),
                    const SizedBox(height: 26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ActionButton(
                          button: 'Cancel',
                          type: ActionButtonType.cancel,
                          color: state.switchValue
                              ? Constants.cancelButtonColorDark
                              : Constants.cancelButtonColor,
                          textColor: state.switchValue
                              ? const Color.fromARGB(255, 212, 212, 212)
                              : Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 15),
                        ActionButton(
                          button: type == PopupType.add ? 'Add' : 'Update',
                          type: ActionButtonType.add,
                          color: state.switchValue
                              ? Constants.addButtonColorDark
                              : Constants.addButtonColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if (type == PopupType.add) {
                              addTask(context);
                            } else {
                              updateTask(context, oldTask!);
                            }
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

addTask(BuildContext context) {
  final day = fetchToday();
  final time = fetchTime();
  Task task = Task(
    title: titleController.text,
    description: descriptionController.text,
    day: day,
    time: time,
    id: GUIDGen.generate(),
  );
  // the event class wiill trigger when this code run. and this code
  // will run when the add button pressed with the required contents
  // and it will send a task object to the event
  context.read<TaskBloc>().add(AddTask(task: task));
  clearControllers();
  Navigator.pop(context);
}

updateTask(BuildContext context, Task oldTask) {
  final day = fetchToday();
  final time = fetchTime();
  Task editedTask = Task(
    title: titleController.text,
    description: descriptionController.text,
    day: day,
    time: time,
    id: oldTask.id,
    isFavourite: oldTask.isFavourite,
    isDone: false,
  );
  // the event class wiill trigger when this code run. and this code
  // will run when the add button pressed with the required contents
  // and it will send a task object to the event
  context.read<TaskBloc>().add(
        EditTask(
          oldTask: oldTask,
          newTask: editedTask,
        ),
      );
  clearControllers();
  Navigator.pop(context);
}
