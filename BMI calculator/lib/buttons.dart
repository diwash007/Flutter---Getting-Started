import 'package:flutter/material.dart';
import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onTap});
  final IconData icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: () {
        onTap();
      },
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}

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
