import 'package:flashtodo/constants.dart';
import 'package:flashtodo/screens/tasks_screen.dart';
import 'package:flashtodo/states/tasks_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TasksState>(
          create: (_) => TasksState(),
        )
      ],
      child: MaterialApp(
        title: kAppName,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => TasksScreen(),
          '/tasks': (context) => TasksScreen(),
        },
      ),
    );
  }
}
