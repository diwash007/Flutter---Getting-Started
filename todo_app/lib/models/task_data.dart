import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'hello'),
    Task(name: 'helloow'),
    Task(name: 'kaalo')
  ];

  int get taskCount {
    return tasks.length;
  }
}
