import 'package:flutter/material.dart';
import 'package:khalesny/data/task.dart';
import 'package:khalesny/pages/add_task_page.dart';
import 'package:khalesny/widgets/task_item.dart';

class TaskPage extends StatefulWidget {
  TaskPage({super.key, required this.tasks});
  final List<Task> tasks;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    var tasks = widget.tasks;

    return Scaffold(
      appBar: AppBar(
        title: const Text("5alesny"),
        actions: [
          IconButton(
              onPressed: () {
                for (var element in tasks) {
                  element.isComplete = true;
                }
                setState(() {});
              },
              icon: const Icon(Icons.checklist_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskPage(
                onTaskCreated: (task) {
                  tasks.add(Task(name: task));
                },
              ),
            ),
          ).then((value) => setState(() {}));
        },
      ),
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TaskItem(
                  task: tasks[index],
                  onChanged: (newValue) {
                    tasks[index].isComplete = newValue ?? false;
                    setState(() {});
                  },
                  onDelete: () {
                    tasks.removeAt(index);
                    setState(() {});
                  },
                ),
              );
            },
          )),
    );
  }
}
