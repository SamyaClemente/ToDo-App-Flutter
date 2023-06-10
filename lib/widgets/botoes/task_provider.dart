import 'package:flutter/material.dart';

class Task {
  String title;
  String description;
  DateTime selectedDate;

  Task({required this.title, required this.description, required this.selectedDate});
}

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
