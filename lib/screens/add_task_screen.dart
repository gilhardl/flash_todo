import 'package:flashtodo/models/task.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({@required this.onTaskSubmitted});

  final Function onTaskSubmitted;

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController _controller = TextEditingController();
  String taskName;

  void _submitNewTask() {
    widget.onTaskSubmitted(Task(
      name: taskName,
    ));
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Container(
      color: Color(0xFF737373),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add a task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _theme.primaryColor,
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: TextField(
                autofocus: true,
                controller: _controller,
                decoration: InputDecoration(hintText: 'New task description'),
                onChanged: (value) {
                  taskName = value;
                },
                onSubmitted: (value) => _submitNewTask(),
              ),
            ),
            FlatButton(
              color: _theme.primaryColor,
              onPressed: () => _submitNewTask(),
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
