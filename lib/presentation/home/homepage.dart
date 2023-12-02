import 'package:bloc_change_text/domain/models/tasks.dart';
import 'package:bloc_change_text/infrastructure/day_fetch.dart';
import 'package:bloc_change_text/presentation/home/widgets/task_list.dart';
import 'package:bloc_change_text/widgets/greetings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../application/bloc_exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final day = fetchToday();
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        // list of task object from bloc's state that emitted
        List<Task> taskList = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Greetings(
                greetingText: day == 'Friday'
                    ? 'Weekend 🎉'
                    : day == 'Sunday'
                        ? '$day ;)'
                        : '$day :)'),
            if (taskList.isEmpty)
              Padding(
                padding: EdgeInsets.all(120),
                child: BlocBuilder<SwitchBloc, SwitchState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Center(
                          child: state.switchValue
                              ? Lottie.asset('assets/animations/todo_dark.json')
                              : Lottie.asset('assets/animations/todo.json'),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Add New Todo',
                          style: TextStyle(
                              color: state.switchValue
                                  ? const Color(0xFF6A7097)
                                  : const Color(0xFFE2E5EF),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Helvatica'),
                        )
                      ],
                    );
                  },
                ),
              ),
            TaskList(taskList: taskList),
          ],
        );
      },
    );
  }
}
