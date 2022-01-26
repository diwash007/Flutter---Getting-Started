import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String trs = await task2();
  task3(trs);
}

void task1() {
  String result = 'task 1 data';
  print('task 1 done');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result;
  await Future.delayed(threeSeconds, () {
    String result = 'task 2 data';
    print('task 2 done');
  });
  return result;
}

void task3(r) {
  String result = 'task 3 data';
  print('task 3 done $r');
}
