import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.title, @required this.onTap});
  final Function onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w700, letterSpacing: 6.0),
          ),
        ),
        decoration: BoxDecoration(
          color: kBtnColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
