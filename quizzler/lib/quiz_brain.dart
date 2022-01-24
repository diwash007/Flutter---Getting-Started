import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question.dart';

class QuizBrain {
  int _quesNum = 0;
  int score = 0;
  List<Icon> scoreKeeper = [];
  List<Question> _questions = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void nextQues() {
    _quesNum++;
  }

  String getQuestionText() {
    return _questions[_quesNum].quesText;
  }

  bool getCorrectAns() {
    return _questions[_quesNum].quesAns;
  }

  void updateScore(userAns) {
    if (this.getCorrectAns() == userAns) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      score++;
    } else
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    this.nextQues();
  }

  void checkGameOver(context) {
    if (_quesNum == _questions.length) {
      Alert(
        context: context,
        title: "Quiz finished!",
        desc: 'Score: ${this.score}',
        buttons: [
          DialogButton(
            child: Text(
              "Play Again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 150,
          )
        ],
      ).show();
      this.reset();
    }
  }

  void reset() {
    scoreKeeper = [];
    _quesNum = 0;
    score = 0;
  }
}
