import 'package:flutter/material.dart';

class TextFieldTodo extends StatelessWidget {
  const TextFieldTodo({
    Key? key,
    required this.controller,
    required this.content,
    required this.color,
  }) : super(key: key);
  final String content;
  final TextEditingController controller;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: color,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 2),
          borderRadius: BorderRadius.circular(15),
          
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
          borderRadius: BorderRadius.circular(15),
        ),
        label: Row(
          children: [
            const SizedBox(width: 10),
            Text(
              content,
              style: TextStyle(color: color, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
