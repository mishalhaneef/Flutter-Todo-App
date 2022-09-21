import 'package:bloc_change_text/application/bloc_exports.dart';
import 'package:bloc_change_text/core/constants.dart';
import 'package:flutter/material.dart';

class DoItLogoWidget extends StatelessWidget {
  const DoItLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchBloc, SwitchState>(
      builder: (context, state) {
        return Row(
          children: [
            Text('DO ',
                style: TextStyle(
                  fontSize: 25,
                  color: state.switchValue
                      ? const Color.fromARGB(255, 138, 138, 138)
                      : Colors.black,
                )),
            Text(
              'IT',
              style: TextStyle(
                  fontSize: 25,
                  color: state.switchValue
                      ? Colors.white
                      : Constants.addButtonColor),
            )
          ],
        );
      },
    );
  }
}
