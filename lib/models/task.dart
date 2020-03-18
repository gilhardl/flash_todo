import 'package:flutter/cupertino.dart';

class Task {
  Task({
    @required this.description,
    this.done = false,
  });

  String description;
  bool done;
  DateTime createdAt;
}
