import 'package:flutter/material.dart';

import '../../../core/enums.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.type,
    required this.color,
    required this.textColor,
    required this.button,
    this.onPressed,
  }) : super(key: key);

  final ActionButtonType type;
  final Color textColor;
  final Color color;
  final String button;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape:
              MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
          backgroundColor: MaterialStateProperty.all<Color>(color)),
      child: Text(
        button,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
