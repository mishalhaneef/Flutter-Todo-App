import 'package:bloc_change_text/presentation/home/add_todo_screen.dart';
import 'package:flutter/material.dart';

import '../application/bloc_exports.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchBloc, SwitchState>(
      builder: (context, state) {
        
        return AppBar(
          
          actions: [
            IconButton(
              onPressed: () {
                showAddTodoPopup(context);
              },
              icon: const Icon(Icons.add),
            ),
            
            const SizedBox(width: 2)
          ],
          iconTheme: IconThemeData(
            color: state.switchValue 
            ? const Color(0xFF6A7097) 
            : Colors.black,
          ),
          elevation: 0,
        );
      },
    );
  }
}
