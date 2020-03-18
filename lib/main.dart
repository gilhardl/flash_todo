import 'package:flashtodo/constants.dart';
import 'package:flashtodo/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TasksScreen(),
        '/tasks': (context) => TasksScreen(),
      },
    );
  }
}
