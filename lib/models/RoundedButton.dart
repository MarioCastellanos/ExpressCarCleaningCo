import 'package:cta_auto_detail/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color rbColor;
  final String title;
  final Function onPressed;

  RoundedButton({this.title,this.onPressed, this.rbColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: rbColor,
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
//            fontFamily: 'CrimsonText',
            fontSize: 16,
//            letterSpacing: 2.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  final Color textColor;
  final Color cBColor;
  final String title;
  final Function onPressed;
  final bool splashValue;

  ContinueButton({this.title,this.onPressed, this.cBColor, this.splashValue = false, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: cBColor,
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        elevation: 20,
        splashColor: splashValue == false ? Colors.transparent : ExpressCarWashRED,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
//            fontFamily: 'CrimsonText',
            fontSize: 16,
//            letterSpacing: 2.0,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
