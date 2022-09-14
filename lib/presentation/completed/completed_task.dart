import 'package:bloc_change_text/presentation/home/widgets/task_list.dart';
import 'package:bloc_change_text/presentation/home/widgets/task_tile.dart';
import 'package:bloc_change_text/widgets/greetings.dart';
import 'package:flutter/cupertino.dart';

import '../home/homepage.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Greetings(greetingText: 'Completed :D'),
        // ListView.builder(
        //   physics: const BouncingScrollPhysics(),
        //   shrinkWrap: true,
        //   itemCount: 1,
        //   itemBuilder: (context, index) {
        //     // return todoCard(todo: todos[index], isChecked: todos[index].isDone);
        //     return TaskList();
        //   },
        // )
      ],
    );
  }
}
