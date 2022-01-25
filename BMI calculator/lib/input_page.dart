import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const BoxBgColor = Color(0xFF1D1E33);
const btnColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  smallBox(
                    color: BoxBgColor,
                  ),
                  smallBox(
                    color: BoxBgColor,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: BoxBgColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  smallBox(
                    color: BoxBgColor,
                  ),
                  smallBox(
                    color: BoxBgColor,
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

class smallBox extends StatelessWidget {
  smallBox({@required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
