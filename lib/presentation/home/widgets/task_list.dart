import 'package:bloc_change_text/domain/models/tasks.dart';
import 'package:bloc_change_text/presentation/home/widgets/task_tile.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return taskTile(
            task: taskList[index],
            isChecked: taskList[index].isDone,
            context: context,
          );
          // return Expanded(child: TaskList());
        },
      ),
    );
  }
}
