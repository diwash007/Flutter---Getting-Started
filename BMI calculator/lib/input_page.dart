import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_widget.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF111328);
const inactiveCardColor = Color(0xFF1D1E33);
const activeBorderColor = Color(0xFFEB1555);
const btnColor = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: reusableCard(
                        color: selectedGender == Gender.male
                            ? activeCardColor
                            : inactiveCardColor,
                        borderColor: selectedGender == Gender.male
                            ? activeBorderColor
                            : inactiveCardColor,
                        cardChild: genderWidget('MALE', FontAwesomeIcons.male),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: reusableCard(
                        color: selectedGender == Gender.female
                            ? activeCardColor
                            : inactiveCardColor,
                        borderColor: selectedGender == Gender.female
                            ? activeBorderColor
                            : inactiveCardColor,
                        cardChild:
                            genderWidget('FEMALE', FontAwesomeIcons.female),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: activeCardColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: reusableCard(
                      color: activeCardColor,
                      borderColor: activeCardColor,
                    ),
                  ),
                  Expanded(
                    child: reusableCard(
                      color: activeCardColor,
                      borderColor: activeCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: bottomContainerHeight,
              decoration: BoxDecoration(
                color: btnColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ));
  }
}
