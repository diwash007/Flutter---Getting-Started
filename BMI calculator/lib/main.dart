import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'result_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) => ResultsPage(),
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
    );
  }
}
