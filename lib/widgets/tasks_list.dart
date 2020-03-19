import 'package:flashtodo/models/task.dart';
import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  TasksList({
    @required this.tasks,
    @required this.onTaskToggled,
  });

  final List<Task> tasks;
  final Function onTaskToggled;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) {
        return TaskTile(
          taskName: tasks[i].name,
          done: tasks[i].done,
          onTaskToggled: (value) {
            onTaskToggled(i);
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}

class TaskTile extends StatelessWidget {
  TaskTile({
    @required this.taskName,
    @required this.done,
    @required this.onTaskToggled,
  });

  final String taskName;
  final bool done;
  final Function onTaskToggled;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskName),
      trailing: Checkbox(
        value: done,
        onChanged: onTaskToggled,
      ),
    );
  }
}
