import 'package:flashtodo/models/task.dart';
import 'package:flutter/material.dart';

class TasksList extends StatefulWidget {
  TasksList({@required this.tasks});

  List<Task> tasks;

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.tasks
          .map((task) => ListTile(
                title: Text(task.description),
                trailing: Checkbox(
                  value: task.done,
                  onChanged: (value) {
                    setState(() {
                      task.done = value;
                    });
                  },
                ),
              ))
          .toList(),
    );
  }
}
