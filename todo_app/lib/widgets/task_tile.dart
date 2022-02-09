import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  String task;
  bool? isChecked = false;

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.task,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckbox(
        checkboxState: isChecked,
        toggleCheckboxState: (newValue) {
          setState(() {
            isChecked = newValue!;
          });
        },
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  const TaskCheckbox(
      {Key? key,
      required this.checkboxState,
      required this.toggleCheckboxState})
      : super(key: key);

  final bool? checkboxState;
  final void Function(bool?)? toggleCheckboxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}
