import 'package:flutter/material.dart';
import 'task_tile.dart';
import '../models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, child) {
        return ListView.builder(
          itemBuilder: (BuildContext context, index) {
            return TaskTile(
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkboxCallback: (bool? checkboxState) {
                  // setState(() {
                  //   widget.tasks[index].toggelDone();
                  // });
                });
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}
