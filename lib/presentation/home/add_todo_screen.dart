import 'package:bloc_change_text/core/constants.dart';
import 'package:bloc_change_text/core/enums.dart';
import 'package:bloc_change_text/core/global.dart';
import 'package:bloc_change_text/presentation/home/widgets/todo_textfield.dart';
import 'package:flutter/material.dart';

import '../../application/bloc_exports.dart';
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
                    const Text('Add Task',
                        style: TextStyle(
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
                          type: ActionButtonType.cancel,
                          color: state.switchValue
                              ? Constants.addButtonColorDark
                              : Constants.addButtonColor
                        ),
                        const SizedBox(width: 15),
                        ActionButton(
                          type: ActionButtonType.add,
                          color: state.switchValue
                              ? Constants.cancelButtonColorDark
                              : Constants.cancelButtonColor
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
