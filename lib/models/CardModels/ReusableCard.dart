import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Reusable Card Class

/// CLASSNAME:
/// PARAMETERS:
/// DESCRIPTION:

class ReusableCard extends StatelessWidget {
  final Widget childWidget;
  final Function onPressed;
  final Color cardColor;

  final int flexFactor;

  ReusableCard(
      {@required this.childWidget,
      @required this.onPressed,
      @required this.cardColor,
      this.flexFactor = 1});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexFactor,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: childWidget),
      ),
    );
  }
}
