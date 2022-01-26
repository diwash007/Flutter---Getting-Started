import 'dart:math';

class CalcBrain {
  CalcBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calcBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getMessage() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Do more exercise.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Keep it up!';
    } else {
      return 'You have a lower than normal body weight. You should eat  more.';
    }
  }
}
