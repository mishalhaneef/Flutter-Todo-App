import 'package:flutter/material.dart';

class TextFieldTodo extends StatelessWidget {
  const TextFieldTodo({
    Key? key,
    required this.controller,
    required this.content,
  }) : super(key: key);
  final String content;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Row(
          children: [
            const SizedBox(width: 10),
            Text(
              content,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
