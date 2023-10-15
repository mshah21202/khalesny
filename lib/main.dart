import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khalesny/data/task.dart';
import 'package:khalesny/pages/task_page.dart';

Future<void> main() async {
  await Hive.initFlutter();

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
