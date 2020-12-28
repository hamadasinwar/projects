
import 'package:flutter/material.dart';
import 'models/tasks.dart';

class MyProvider extends ChangeNotifier {
  List<Task> tasks;
  setTasks(tasks) {
    this.tasks = tasks;
    notifyListeners();
  }
}
