import 'package:bloc_change_text/widgets/greetings.dart';
import 'package:flutter/cupertino.dart';

import '../../application/bloc_exports.dart';
import '../home/widgets/task_list.dart';

class FavouriteTodo extends StatelessWidget {
  const FavouriteTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Greetings(greetingText: 'Favourite <3'),
        BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return TaskList(taskList: state.favouriteTasks);
          },
        )
      ],
    );
  }
}
