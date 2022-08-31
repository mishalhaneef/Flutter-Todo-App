import 'package:bloc_change_text/domain/models/todos_model.dart';
import 'package:bloc_change_text/widgets/greetings.dart';
import 'package:flutter/material.dart';

import 'widgets/todo_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Greetings(greetingText: 'Monday :)'),
        ListView.builder(
          shrinkWrap: true,
          itemCount: Todo.todos.length,
          itemBuilder: (context, index) {
            return todoCard(
                todo: Todo.todos[index],
                isChecked: Todo.todos[index].isCompleted);
          },
        )
      ],
    );
  }
}
