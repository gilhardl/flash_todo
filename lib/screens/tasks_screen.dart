import 'package:flashtodo/models/task.dart';
import 'package:flashtodo/screens/add_task_screen.dart';
import 'package:flashtodo/widgets/tasks_list.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final tasksListName = 'Flash todo';
  final List<Task> tasks = [
    Task(name: 'Milk'),
    Task(name: 'Salad'),
    Task(name: 'Tomato'),
    Task(name: 'Patatoes'),
    Task(name: 'Butter'),
    Task(name: 'Cheese'),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Scaffold(
      backgroundColor: _theme.primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: AddTaskScreen(onTaskSubmitted: (newTask) {
                setState(() {
                  tasks.add(newTask);
                });
                Navigator.pop(context);
              }),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            ),
          );
        },
        child: Icon(Icons.add),
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
                  '${tasks.length} tasks',
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
              child: TasksList(
                  tasks: tasks,
                  onTaskToggled: (index) {
                    setState(() {
                      tasks[index].toggle();
                    });
                  }),
            ),
          )
        ],
      ),
    );
  }
}
