import 'package:first_project/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task("Aprender Flutter", 'assets/images/image01.jpeg', 3),
    Task("Aprender Dart", 'assets/images/image02.png', 2),
    Task("Aprender Git", 'assets/images/image03.png', 3),
    Task("Aprender BackEnd", 'assets/images/image04.jpg', 5),
  ];

  void newTask(String name, String pic, int dif) {
    taskList.add(Task(name, pic, dif));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
