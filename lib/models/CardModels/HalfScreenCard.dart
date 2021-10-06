import 'package:flutter/material.dart';
import 'package:express_car_cleaning_co/constants.dart';

class HalfScreenCard extends StatelessWidget {
  final Widget childWidget;

  HalfScreenCard({this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: ECCCBlueAccent.withOpacity(.5),
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: childWidget,
    );
  }
}
