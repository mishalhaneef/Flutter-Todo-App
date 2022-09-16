import 'package:bloc_change_text/core/constants.dart';
import 'package:bloc_change_text/domain/models/tasks.dart';
import 'package:flutter/material.dart';

import '../../../application/bloc_exports.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {Key? key, required this.task, this.isChecked, required this.taskList})
      : super(key: key);
  final Task task;
  final isChecked;
  final List<Task> taskList;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchBloc, SwitchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 18.0,
                    spreadRadius: -15,
                  ), //BoxShadow
                ],
                color: state.switchValue
                    ? Constants.appDarkThemeColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: state.switchValue
                      ? Constants.addButtonColorDark
                      : Colors.grey,
                )),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.all(5),
              leading: BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, state) {
                  return Checkbox(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    splashRadius: 15,
                    checkColor: state.switchValue ? Colors.black : Colors.white,
                    fillColor: MaterialStateProperty.all<Color>(
                      state.switchValue
                          ? Colors.white
                          : Constants.appThemeColor,
                    ),
                    value: task.isDone,
                    onChanged: task.isDeleted == false
                        ? (bool? value) {
                            context
                                .read<TaskBloc>()
                                .add(UpdateTask(task: task));
                          }
                        : null,
                  );
                },
              ),
              title: Text.rich(
                TextSpan(text: task.title),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Helvatica_lite',
                  decoration: task.isDone == true
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: task.isDone == true
                      ? state.switchValue
                          ? const Color(0xFF575862)
                          : Colors.grey
                      : state.switchValue
                          ? const Color(0xFFDDDDDD)
                          : Colors.black,
                ),
              ),
              subtitle: Text('Monday | 10:17 pm',
                  // '${todo.day} | ${todo.time}',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Helvatica_lite',
                    color: task.isDone == true
                        ? state.switchValue
                            ? const Color(0xFF474853)
                            : Colors.grey
                        : state.switchValue
                            ? const Color(0xFF656A85)
                            : const Color.fromARGB(255, 92, 92, 92),
                  )),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: ListTile(
                    title: const Text('Title'),
                    subtitle: Text(task.title),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: ListTile(
                    title: const Text('Task'),
                    subtitle: Text(task.description),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 20,
                        color: state.switchValue
                            ? Constants.addButtonColorDark
                            : Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                    //
                    IconButton(
                      icon: Icon(
                        Icons.bookmark,
                        size: 20,
                        color: state.switchValue
                            ? Constants.addButtonColorDark
                            : Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                    //
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        size: 20,
                        color: state.switchValue
                            ? Constants.addButtonColorDark
                            : Colors.grey,
                      ),
                      onPressed: () {
                        removeOrDeleteTask(context, task);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

void removeOrDeleteTask(BuildContext ctx, Task task) {

  if(task.isDeleted == true){
    ctx.read<TaskBloc>().add(DeleteTask(task: task));          
  }else{
    ctx.read<TaskBloc>().add(RemoveTask(task: task));
  }
}
