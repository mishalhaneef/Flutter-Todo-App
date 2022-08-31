import 'package:bloc_change_text/domain/models/todos_model.dart';
import 'package:bloc_change_text/presentation/home/widgets/todo_card.dart';
import 'package:bloc_change_text/widgets/greetings.dart';
import 'package:flutter/cupertino.dart';

class FavouriteTodo extends StatelessWidget {
  const FavouriteTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const Greetings(greetingText: 'Favourite <3'),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, index) {
            return todoCard(
                todo: Todo.todos[2],
                isChecked: Todo.todos[2].isCompleted);
          },
        )
      ],
    );
  }
}
