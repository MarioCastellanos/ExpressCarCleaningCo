import 'package:flutter/material.dart';
import 'package:express_car_cleaning_co/constants.dart';

/// CLASSNAME:
/// PARAMETERS:
/// DESCRIPTION:

class ProfileTextFields extends StatelessWidget {
  const ProfileTextFields({@required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: ECCCDarkBlue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
