import 'package:bloc_change_text/core/constants.dart';
import 'package:flutter/material.dart';

import '../application/bloc_exports.dart';

class Greetings extends StatelessWidget {
  const Greetings({
    Key? key,
    required this.greetingText,
  }) : super(key: key);

  final greetingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18, left: 18, top: 35, bottom: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(greetingText, style: Constants.headingTextStyle),
          const SizedBox(height: 10),
           BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return Text(
                '${state.allTasks.length} Task',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              );
            },
          ),
        ],
      ),
    );
  }
}
