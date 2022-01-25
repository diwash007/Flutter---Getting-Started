import 'package:flutter/material.dart';

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
                    color: Color(0xFF1D1E33),
                  ),
                  smallBox(
                    color: Color(0xFF1D1E33),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  smallBox(
                    color: Color(0xFF1D1E33),
                  ),
                  smallBox(
                    color: Color(0xFF1D1E33),
                  ),
                ],
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
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
