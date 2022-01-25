import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          color: Color(0xFF0A0E12),
        ),
        primaryColor: Colors.pink,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: InputPage(),
    );
  }
}
