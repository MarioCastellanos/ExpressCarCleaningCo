import 'package:flutter/material.dart';

class CarWashPackage extends StatelessWidget {
  final String packageTitle;
  final TextStyle packageTitleStyle;
  final Text packageDetails;

  CarWashPackage(
      {@required this.packageTitle,
      @required this.packageTitleStyle,
      @required this.packageDetails});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text(
          packageTitle,
          style: packageTitleStyle,
        ),
        packageDetails,
      ],
    );
  }
}
