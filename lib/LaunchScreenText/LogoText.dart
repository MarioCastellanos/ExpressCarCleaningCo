import 'package:flutter/material.dart';

/// CLASSNAME:LogoText
///
/// PARAMETERS: NONE
///
/// DESCRIPTION: The logo text in LaunchScreen and its textStyle
///

class LogoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'EXPRESS CAR CLEANING \nCO.',
      textAlign: TextAlign.start,
      style: logoTextStyle,
    );
  }
}

const TextStyle logoTextStyle = TextStyle(
  height: 1,
  fontWeight: FontWeight.w700,
  fontFamily: 'Vollkorn',
  fontStyle: FontStyle.italic,
  color: Colors.black,
  backgroundColor: Colors.white,
  letterSpacing: 1.0,
  fontSize: 46,
);
