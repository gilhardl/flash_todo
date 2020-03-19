import 'package:flashtodo/models/task.dart';
import 'package:flashtodo/states/tasks_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TasksState tasksState = Provider.of<TasksState>(context);

    return ListView.builder(
      itemBuilder: (context, i) {
        final task = tasksState.tasks[i];

        return TaskTile(
          taskName: task.name,
          done: task.done,
          onChanged: (value) {
            if (!tasksState.selectionMode) {
              tasksState.toggleTask(i);
            }
          },
          onLongPress: () {
            if (!tasksState.selectionMode || task.selected) {
              tasksState.toggleSelectionMode();
            }
            if (tasksState.selectionMode) {
              tasksState.toggleTaskSelection(i);
            } else {
              tasksState.unselectAllTasks();
            }
          },
          onTap: tasksState.selectionMode
              ? () {
                  tasksState.toggleTaskSelection(i);

                  if (tasksState.tasks.every((t) => !t.selected)) {
                    tasksState.toggleSelectionMode();
                  }
                }
              : null,
          selected: task.selected,
        );
      },
      itemCount: tasksState.tasks.length,
    );
  }
}

class TaskTile extends StatelessWidget {
  TaskTile({
    @required this.taskName,
    @required this.done,
    this.selected = false,
    @required this.onChanged,
    this.onLongPress,
    this.onTap,
  });

  final String taskName;
  final bool done;
  final bool selected;
  final Function onChanged;
  final Function onLongPress;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Material(
      color: selected ? _theme.disabledColor.withOpacity(0.1) : null,
      child: ListTile(
        title: Text(
          taskName,
          style: TextStyle(
            decoration: done ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          value: done,
          onChanged: !done ? onChanged : null,
        ),
        selected: selected,
        onLongPress: onLongPress,
        onTap: onTap,
      ),
    );
  }
}
