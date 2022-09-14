import 'package:bloc_change_text/domain/models/tasks.dart';
import 'package:bloc_change_text/presentation/home/widgets/task_list.dart';
import 'package:bloc_change_text/widgets/greetings.dart';
import 'package:flutter/material.dart';

import '../../application/bloc_exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        // list of task object from bloc's state that emitted
        List<Task> taskList = state.allTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Greetings(greetingText: 'Monday :)'),
            TaskList(taskList: taskList),
          ],
        );
      },
    );
  }
}
