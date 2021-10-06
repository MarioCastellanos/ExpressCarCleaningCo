import 'package:flutter/material.dart';
import 'package:express_car_cleaning_co/constants.dart';

class SavedLocations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Saved Locations',
      style: TextStyle(
        color: ECCCDarkBlue,
        fontSize: 30,
        fontFamily: 'Vollkorn',
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    );
  }
}
