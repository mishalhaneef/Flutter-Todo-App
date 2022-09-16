import 'package:bloc_change_text/presentation/home/widgets/task_list.dart';
import 'package:bloc_change_text/widgets/greetings.dart';
import 'package:flutter/cupertino.dart';

import '../../application/bloc_exports.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Greetings(greetingText: 'Completed :D'),
        BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return TaskList(taskList: state.completedTasks);
          },
        ),
      ],
    );
  }
}
