import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:khalesny/data/task.dart';
import 'package:khalesny/pages/add_task_page.dart';
import 'package:khalesny/widgets/task_item.dart';

class TaskPage extends StatefulWidget {
  TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Task> tasks = [];

  @override
  void initState() {
    _getTasks();
    super.initState();
  }

  void _getTasks() async {
    var box = await Hive.openBox('tasks');

    var list = box.get("task_list", defaultValue: []) as List;
    tasks = list
        .map((e) => (e as Map<dynamic, dynamic>).cast<String, dynamic>())
        .map<Task>((e) => Task.fromJson(e))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                onTaskCreated: (task) async {
                  var box = await Hive.openBox('tasks');

                  var list = box.get("task_list", defaultValue: []) as List;

                  list.add(task.toJson());

                  box.put("task_list", list).then((value) {
                    _getTasks();
                    setState(() {});
                  });
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
                  onChanged: (newValue) async {
                    var box = await Hive.openBox('tasks');

                    var list = (box.get("task_list", defaultValue: []) as List)
                        .map((e) => (e as Map<dynamic, dynamic>)
                            .cast<String, dynamic>())
                        .map<Task>((e) => Task.fromJson(e))
                        .toList();

                    list[index].isComplete = newValue ?? false;

                    box
                        .put("task_list", list.map((e) => e.toJson()).toList())
                        .then((value) {
                      _getTasks();
                      setState(() {});
                    });
                  },
                  onDelete: () async {
                    var box = await Hive.openBox('tasks');

                    var list = box.get("task_list", defaultValue: []) as List;

                    list.removeAt(index);

                    box.put("task_list", list).then((value) {
                      _getTasks();
                      setState(() {});
                    });
                  },
                ),
              );
            },
          )),
    );
  }
}
