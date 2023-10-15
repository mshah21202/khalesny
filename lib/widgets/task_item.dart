import 'package:flutter/material.dart';
import 'package:khalesny/data/task.dart';

class TaskItem extends StatelessWidget {
  TaskItem(
      {super.key,
      required this.task,
      required this.onDelete,
      required this.onChanged});
  final Task task;
  final void Function()? onDelete;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: task.isComplete ? Colors.lightGreen : Colors.black12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: task.isComplete, onChanged: onChanged),
                Text(
                  task.name,
                  style: TextStyle(
                      decoration:
                          task.isComplete ? TextDecoration.lineThrough : null,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
