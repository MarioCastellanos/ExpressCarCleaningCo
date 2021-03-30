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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text(
            packageTitle,
            textAlign: TextAlign.center,
            style: packageTitleStyle,
          ),
        ),
        Expanded(child: packageDetails),
      ],
    );
  }
}
