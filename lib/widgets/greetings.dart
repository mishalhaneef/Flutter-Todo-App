import 'package:bloc_change_text/core/constants.dart';
import 'package:bloc_change_text/presentation/completed/completed_task.dart';
import 'package:bloc_change_text/root_screen.dart';
import 'package:flutter/material.dart';

import '../application/bloc_exports.dart';

class Greetings extends StatelessWidget {
  const Greetings({
    Key? key,
    required this.greetingText,
  }) : super(key: key);

  final String greetingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18, left: 18, top: 35, bottom: 60),
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, switchStateRoot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(greetingText, style: Constants.headingTextStyle),
              const SizedBox(height: 10),
              BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () => RootScreen.selectedIndexNotifier.value = 1,
                    child: Text(
                      '${state.completedTasks.length} of ${state.pendingTasks.length + state.completedTasks.length} task completed',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: switchStateRoot.switchValue
                              ? const Color(0xFF7F859A)
                              : Colors.grey),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
