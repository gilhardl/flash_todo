import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController _controller = TextEditingController();
  String description;

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
                controller: _controller,
                decoration: InputDecoration(hintText: 'New task description'),
                onChanged: (value) {
                  description = value;
                },
              ),
            ),
            FlatButton(
              color: _theme.primaryColor,
              onPressed: () {
                print(description);
              },
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
