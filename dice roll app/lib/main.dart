import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red.shade400,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red.shade400,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  // const DicePage({ Key? key }) : super(key: key);
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNum = 1;
  var rightDiceNum = 1;

  void roll() {
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TextButton(
              child: Image.asset('images/dice$leftDiceNum.png'),
              onPressed: () {
                roll();
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              child: Image.asset('images/dice$rightDiceNum.png'),
              onPressed: () {
                roll();
              },
            ),
          ),
        ],
      ),
    );
  }
}
