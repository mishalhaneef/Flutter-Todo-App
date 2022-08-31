import 'package:bloc_change_text/domain/models/todos_model.dart';
import 'package:flutter/material.dart';

todoCard({
  required Todo todo,
  isChecked,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
    child: Container(
        decoration: const BoxDecoration(
          // borderRadius: const BorderRadius.all(Radius.circular(15)),
          // border: Border.all(width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 0.0),
              blurRadius: 14.0,
              spreadRadius: -15,
            ), //BoxShadow
          ],
        ),
        height: 90,
        width: 150,
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Checkbox(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                splashRadius: 10,
                checkColor: Colors.white,
                value: isChecked,
                onChanged: (bool? value) {},
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 230,
                    child: Text.rich(
                      TextSpan(text: todo.task),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Helvatica_lite',
                          decoration: todo.isCompleted == true
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: todo.isCompleted == true
                              ? Colors.grey
                              : Colors.black),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${todo.day} | ${todo.time}',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Helvatica_lite',
                        color: todo.isCompleted == true
                            ? Colors.grey
                            : const Color.fromARGB(255, 92, 92, 92)),
                  )
                ],
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_down),
              const SizedBox(width: 15)
            ],
          ),
        )),
  );
}
