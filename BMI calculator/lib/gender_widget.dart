import 'package:flutter/material.dart';

const genderLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

class genderWidget extends StatelessWidget {
  final String gender;
  final IconData icon;
  genderWidget(this.gender, this.icon);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: genderLabelTextStyle,
        )
      ],
    );
  }
}
