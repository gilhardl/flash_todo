import 'package:flashtodo/models/task.dart';
import 'package:flutter/foundation.dart';

class TasksState with ChangeNotifier {
  List<Task> tasks = [];
  bool selectionMode = false;

  int get tasksCount {
    return tasks.length;
  }

  int get tasksTodoCount {
    return tasksTodo.length;
  }

  int get tasksDoneCount {
    return tasksDone.length;
  }

  List<Task> get selectedTasks {
    return tasks.where((task) => task.selected).toList();
  }

  List<Task> get tasksTodo {
    return tasks.where((task) => !task.done).toList();
  }

  List<Task> get tasksDone {
    return tasks.where((task) => task.done).toList();
  }

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
    for (var task in selectedTasks) {
      task.selected = true;
    }
    notifyListeners();
  }

  unselectAllTasks() {
    for (var task in selectedTasks) {
      task.selected = false;
    }
    notifyListeners();
  }
}
