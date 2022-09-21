import 'dart:ui';

import 'package:bloc_change_text/application/bloc_exports.dart';
import 'package:bloc_change_text/core/constants.dart';
import 'package:flutter/material.dart';

dialogueCard({
  required VoidCallback onPressed,
  required String head,
  required description,
  required context,
  required SwitchState state,
}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black38,
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (ctx, anim1, anim2) => AlertDialog(
      backgroundColor:
          state.switchValue ? Constants.cancelButtonColorDark : null,
      title: Text(head),
      content: Text(
        description,
        style: TextStyle(color: Colors.grey),
      ),
      elevation: 2,
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(onPressed: onPressed, child: Text(getFirstWord(head))),
      ],
    ),
    transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
      filter:
          ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
      child: FadeTransition(
        opacity: anim1,
        child: child,
      ),
    ),
    context: context,
  );
}

String getFirstWord(String word) {
  List<String> wordList = word.split(" ");
  return wordList[0];
}
