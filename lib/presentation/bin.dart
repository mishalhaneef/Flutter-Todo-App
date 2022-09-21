import 'package:bloc_change_text/core/constants.dart';
import 'package:bloc_change_text/presentation/home/widgets/task_list.dart';
import 'package:bloc_change_text/widgets/showdialogue.dart';
import 'package:flutter/material.dart';

import '../application/bloc_exports.dart';
import '../widgets/appbar.dart';

class Bin extends StatelessWidget {
  const Bin({Key? key}) : super(key: key);

  static const id = 'bin_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 18, left: 18, top: 35, bottom: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Recycle Bin',
                        style: Constants.headingTextStyle),
                    const Spacer(),
                    BlocBuilder<SwitchBloc, SwitchState>(
                        builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          dialogueCard(
                            context: context,
                            description: 'Are you sure ?',
                            head: 'Clear bin',
                            onPressed: () {
                              context.read<TaskBloc>().add(ClearBin());
                              Navigator.of(context).pop();
                            },
                            state: state,
                          );
                        },
                        tooltip: 'Clear Bin',
                        icon: const Icon(Icons.delete),
                      );
                    })
                  ],
                ),
                const SizedBox(height: 10),
                BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    return Text(
                      '${state.removedTasks.length} Deleted Task',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    );
                  },
                ),
              ],
            ),
          ),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return TaskList(taskList: state.removedTasks);
            },
          )
        ],
      ),
    );
  }
}
