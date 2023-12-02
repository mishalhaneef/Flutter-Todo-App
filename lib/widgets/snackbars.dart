import 'package:flutter/material.dart';

snackBar(text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(left: 60, right: 60, bottom: 30),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    content: Text(
      '  $text',
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    duration: const Duration(seconds: 4),
  ));
}
