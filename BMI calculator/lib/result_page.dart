import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'buttons.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    'Normal',
                    style: resultTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '18.3',
                    style: bmiTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'hello',
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
