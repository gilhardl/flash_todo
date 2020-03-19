import 'package:flashtodo/screens/add_task_screen.dart';
import 'package:flashtodo/states/tasks_state.dart';
import 'package:flashtodo/widgets/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  final tasksListName = 'Flash todo';

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    void _presentAddTaskModalBottomSheet() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
          child: AddTaskScreen(),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        ),
      );
    }

    void _removeSelectedTasks(TasksState tasksState) {
      tasksState.removeSelectedTasks();
      tasksState.toggleSelectionMode();
    }

    return Consumer<TasksState>(
      builder: (context, tasksState, child) => Scaffold(
        backgroundColor: _theme.primaryColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            !tasksState.selectionMode
                ? _presentAddTaskModalBottomSheet()
                : _removeSelectedTasks(tasksState);
          },
          child:
              !tasksState.selectionMode ? Icon(Icons.add) : Icon(Icons.delete),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 50.0,
                left: 32.0,
                right: 32.0,
                bottom: 32.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 32.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      color: _theme.primaryColor,
                      size: 32.0,
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    tasksListName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '${tasksState.tasksCount} tasks - ${tasksState.tasksTodoCount} to do',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: _theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TasksList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
