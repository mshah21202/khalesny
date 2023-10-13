import 'package:flutter/material.dart';
import 'package:khalesny/data/task.dart';
import 'package:khalesny/pages/task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = [];
    return MaterialApp(
      home: TaskPage(
        tasks: tasks,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
