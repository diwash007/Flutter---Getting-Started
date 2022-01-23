import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(Xylophone());

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  void playMusic(int num) {
    // final player = AudioCache();
    AudioCache().play('note$num.wav');
  }

  Widget buildKey(int num, Color keyColor) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Container(
          color: keyColor,
        ),
        onPressed: () {
          playMusic(num);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(children: [
            buildKey(1, Colors.red),
            buildKey(2, Colors.blue),
            buildKey(3, Colors.green),
            buildKey(4, Colors.pink),
            buildKey(5, Colors.orange),
            buildKey(6, Colors.pink),
            buildKey(7, Colors.indigo),
          ]),
        ),
      ),
    );
  }
}
