import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  // ResultsPage(
  //     {@required this.bmi,
  //     @required this.resultText,
  //     @required this.resultMsg});
  // final String bmi;
  // final String resultText;
  // final String resultMsg;
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  'Your Result',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              borderColor: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    args['resultText'],
                    style: resultTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    args['bmi'],
                    style: bmiTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    args['resultMsg'],
                    style: resultBodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
