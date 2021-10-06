import 'package:flutter/material.dart';

/// CLASSNAME:
/// PARAMETERS:
/// DESCRIPTION:

class CarWashPackage extends StatelessWidget {
  final String packageTitle;
  final TextStyle packageTitleStyle;
  final Text packageDetails;
  final bool flexTitle;

  CarWashPackage(
      {@required this.packageTitle,
      @required this.packageTitleStyle,
      @required this.packageDetails,
      this.flexTitle = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: flexTitle ? 0 : 1,
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
