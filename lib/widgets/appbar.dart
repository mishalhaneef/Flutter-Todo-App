import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [Icon(Icons.add), SizedBox(width: 20)],
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      elevation: 0,
    );
  }
}
