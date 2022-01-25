import 'package:flutter/material.dart';

class reusableCard extends StatelessWidget {
  reusableCard({@required this.color, this.cardChild, this.borderColor});
  final Color color;
  final Color borderColor;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: borderColor,
        ),
      ),
    );
  }
}
