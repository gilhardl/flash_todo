import 'package:flashtodo/models/task.dart';
import 'package:flutter/material.dart';

class TasksState with ChangeNotifier {
  List<Task> tasks = [];
  bool selectionMode = false;

  _reorderTasks() {
    tasks.sort((taskA, taskB) {
      if ((taskA.done && taskB.done) || (!taskA.done && !taskB.done)) {
        return 0;
      } else if (taskA.done && !taskB.done) {
        return 1;
      } else {
        return -1;
      }
    });
  }

  addTask(Task task) {
    tasks.add(task);
    _reorderTasks();
    notifyListeners();
  }

  addTasks(List<Task> tasks) {
    tasks.addAll(tasks);
    _reorderTasks();
    notifyListeners();
  }

  updateTask(int index, Task task) {
    tasks[index] = task;
    _reorderTasks();
    notifyListeners();
  }

  removeTask(int index) {
    tasks.removeAt(index);
    _reorderTasks();
    notifyListeners();
  }

  removeSelectedTasks() {
    final selectedTasks = tasks.where((task) => task.selected).toList();
    for (var task in selectedTasks) {
      tasks.remove(task);
    }
    _reorderTasks();
    notifyListeners();
  }

  toggleTask(int index) {
    tasks[index].toggle();
    _reorderTasks();
    notifyListeners();
  }

  toggleSelectionMode() {
    selectionMode = !selectionMode;
    notifyListeners();
  }

  toggleTaskSelection(int index) {
    tasks[index].toggleSelection();
    notifyListeners();
  }

  selectAllTasks() {
    final selectedTasks = tasks.where((task) => task.selected).toList();
    for (var task in selectedTasks) {
      task.selected = true;
    }
    notifyListeners();
  }

  unselectAllTasks() {
    final selectedTasks = tasks.where((task) => task.selected).toList();
    for (var task in selectedTasks) {
      task.selected = false;
    }
    notifyListeners();
  }
}
