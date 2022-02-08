import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final String task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task),
      trailing: const Checkbox(
        value: false,
        onChanged: null,
      ),
    );
  }
}
