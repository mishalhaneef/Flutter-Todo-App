import 'package:bloc_change_text/core/constants.dart';
import 'package:flutter/material.dart';

class DoItLogoWidget extends StatelessWidget {
  const DoItLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text('DO ', style: TextStyle(fontSize: 25)),
        Text(
          'IT',
          style: TextStyle(
            fontSize: 25,
            color: Constants.addButtonColor,
          ),
        ),
      ],
    );
  }
}
