import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.taskTitle,
    this.isChecked = false,
    required this.checkboxCallback,
    required this.deleteTask,
  }) : super(key: key);

  final String taskTitle;
  final bool isChecked;
  final void Function(bool?) checkboxCallback;
  final void Function()? deleteTask;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: deleteTask,
      child: ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkboxCallback,
        ),
      ),
    );
  }
}
