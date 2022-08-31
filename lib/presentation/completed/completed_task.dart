
import 'package:bloc_change_text/domain/models/todos_model.dart';
import 'package:bloc_change_text/presentation/home/widgets/todo_card.dart';
import 'package:bloc_change_text/widgets/greetings.dart';
import 'package:flutter/cupertino.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Greetings(greetingText: 'Completed :D'),
         ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
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
