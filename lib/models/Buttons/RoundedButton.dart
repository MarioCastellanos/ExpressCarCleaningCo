import 'package:flutter/material.dart';

/// CLASSNAME:
/// PARAMETERS:
/// DESCRIPTION:

class RoundedButton extends StatelessWidget {
  final Color rbColor;
  final String title;
  final Function onPressed;

  RoundedButton({this.title, this.onPressed, this.rbColor});

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
