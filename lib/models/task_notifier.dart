import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoo/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'task 1'),
    Task(name: 'task 3'),
    Task(name: 'task 2'),
    Task(name: 'task 1'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView (_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(task) {
    _tasks.add(Task(name: task));

    notifyListeners();
  }

  void toggleDone(index) {
    print(index);
    _tasks[index].toggleDone();

    notifyListeners();
  }

  void deleteTask(index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
