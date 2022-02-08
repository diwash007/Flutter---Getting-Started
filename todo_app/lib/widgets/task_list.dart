import 'package:flutter/material.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  List<Widget> todoItems() {
    List<Widget> items = [];
    List<String> tasks = ['hi', 'hello'];
    for (String task in tasks) {
      items.add(TaskTile(task: task));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: todoItems(),
    );
  }
}
