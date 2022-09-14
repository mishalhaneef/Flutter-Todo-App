
import 'package:bloc_change_text/presentation/home/homepage.dart';
import 'package:bloc_change_text/presentation/home/widgets/task_tile.dart';
import 'package:bloc_change_text/widgets/greetings.dart';
import 'package:flutter/cupertino.dart';

import '../home/widgets/task_list.dart';

class FavouriteTodo extends StatelessWidget {
  const FavouriteTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Greetings(greetingText: 'Favourite <3'),
        // ListView.builder(
        //   physics: const BouncingScrollPhysics(),
        //   shrinkWrap: true,
        //   itemCount: 1,
        //   itemBuilder: (context, index) {
        //     // return todoCard(
        //     //     todo: todos[2], isChecked: todos[2].isDone);
        //     return TaskList();
        //   },
        // )
      ],
    );
  }
}
