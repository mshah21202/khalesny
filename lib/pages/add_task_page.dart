import 'package:flutter/material.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskPage({super.key, required this.onTaskCreated});
  final TextEditingController _controller = TextEditingController();
  final void Function(String) onTaskCreated;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new task"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onTaskCreated(_controller.text);
          Navigator.pop(context);
        },
        child: const Icon(Icons.check),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                label: Text("Name"),
                border: OutlineInputBorder(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
