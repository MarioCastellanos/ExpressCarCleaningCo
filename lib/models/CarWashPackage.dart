import 'package:flutter/material.dart';

class CarWashPackage extends StatelessWidget {
  final ScrollController scrollController;
  final String packageTitle;
  final TextStyle packageTitleStyle;
  final Text packageDetails;

  CarWashPackage(
      {@required this.scrollController,
      @required this.packageTitle,
      @required this.packageTitleStyle,
      @required this.packageDetails});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      controller: scrollController,
      child: ListView(
        controller: scrollController,
        children: <Widget>[
          Text(
            packageTitle,
            style: packageTitleStyle,
          ),
          packageDetails,
        ],
      ),
    );
  }
}
