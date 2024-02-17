import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/pages/todo.dart';

class ToDoList extends StatelessWidget {
  final ToDo todo;
  final Function(bool?)? onChange;
  final Function() onDelete;
  const ToDoList({
    required this.todo,
    required this.onChange,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          todo.taskName,
          style: TextStyle(
              decoration: todo.taskComplete!
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: Colors.white,
              decorationColor: Colors.white),
        ),
        leading: Checkbox(
          value: todo.taskComplete,
          onChanged: onChange,
          checkColor: Colors.purple[800],
          activeColor: Colors.white,
          // fillColor: MaterialStateProperty.all(Colors.white),
          // focusColor: Colors.white,
          // side: BorderSide(color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          side: MaterialStateBorderSide.resolveWith(
            (states) => const BorderSide(width: 2, color: Colors.white),
          ),
        ),
        trailing: todo.taskComplete!
            ? Wrap(
                // spacing: 12, // space between two icons
                children: <Widget>[
                  // Icon(Icons.call), // icon-1
                  // Icon(Icons.message), // icon-2
                  TextButton(
                    onPressed: onDelete,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ) // icon-3
                ],
              )
            : null,
      ),
    );
  }
}
