import 'package:flashtodo/models/task.dart';
import 'package:flashtodo/states/tasks_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  void _onTaskToggled(TasksState tasksState, int index) {
    if (!tasksState.selectionMode) {
      tasksState.toggleTask(index);
    }
  }

  void _onTaskLongPressed(TasksState tasksState, int index) {
    if (!tasksState.selectionMode || tasksState.tasks[index].selected) {
      tasksState.toggleSelectionMode();
    }
    if (tasksState.selectionMode) {
      tasksState.toggleTaskSelection(index);
    } else {
      tasksState.unselectAllTasks();
    }
  }

  Function _onTaskPressed(TasksState tasksState, int index) {
    return tasksState.selectionMode
        ? () {
            tasksState.toggleTaskSelection(index);

            if (tasksState.tasks.every((t) => !t.selected)) {
              tasksState.toggleSelectionMode();
            }
          }
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksState>(
      builder: (context, tasksState, child) => ListView.builder(
        itemBuilder: (context, i) {
          final task = tasksState.tasks[i];

          return TaskTile(
            taskName: task.name,
            done: task.done,
            onChanged: (value) => _onTaskToggled(tasksState, i),
            onLongPress: () => _onTaskLongPressed(tasksState, i),
            onTap: _onTaskPressed(tasksState, i),
            selected: task.selected,
          );
        },
        itemCount: tasksState.tasks.length,
      ),
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
          onChanged: onChanged,
        ),
        selected: selected,
        onLongPress: onLongPress,
        onTap: onTap,
      ),
    );
  }
}
