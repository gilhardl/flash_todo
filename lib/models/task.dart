import 'package:flutter/cupertino.dart';

class Task {
  Task({
    @required this.name,
    this.description = '',
    this.done = false,
  }) : createdAt = DateTime.now();

  String name;
  String description;
  bool done;
  DateTime createdAt;

  void toggle() {
    done = !done;
  }
}
