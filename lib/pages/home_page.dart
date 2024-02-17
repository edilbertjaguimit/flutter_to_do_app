import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/pages/todo.dart';
import 'package:flutter_to_do_app/pages/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ToDo> todos = [];
  TextEditingController txtAddTaskName = TextEditingController();
  // bool _isEmpty = false;
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.transparent,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 1,
          backgroundColor: Colors.purple[800],
          title: const Text(
            'Add Task',
            style: TextStyle(color: Colors.white),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Text('This is a demo alert dialog.'),
                // Text('Would you like to approve of this message?'),
                TextField(
                  controller: txtAddTaskName,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Type your new task...',
                    // errorText: _isEmpty ? "Value Can't Be Empty" : null,
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  if (txtAddTaskName.text.isNotEmpty) {
                    todos.add(ToDo(taskName: txtAddTaskName.text));
                    Navigator.of(context).pop();
                    txtAddTaskName.text = '';
                  } else {
                    // _isEmpty = true;
                  }
                });
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                txtAddTaskName.text = '';
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ToDo App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
      ),
      body: todos.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return ToDoList(
                    todo: todos[index],
                    onChange: (value) {
                      setState(() {
                        todos[index].taskComplete = !todos[index].taskComplete!;
                      });
                    },
                    onDelete: () {
                      setState(() {
                        todos.remove(todos[index]);
                      });
                    },
                  );
                },
              ),
            )
          : const Center(
              child: Text(
                'No ToDo yet.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: _showMyDialog,
        backgroundColor: Colors.purple[900],
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
