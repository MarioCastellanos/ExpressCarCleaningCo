import 'package:flutter/material.dart';

/// AUTHOR: MARIO H.C.H.
/// DATE: 08/27/21
/// CLASSNAME: CarInfoCard
///
/// PARAMETERS: String info:
///             Function onTap:
///             Color color:
///             Color textColor:
///
/// DESCRIPTION:

class CarInfoCard extends StatelessWidget {
  final String info;
  final Function onTap;
  final Color color;
  final Color textColor;

  CarInfoCard({
    this.info,
    this.onTap,
    this.color = Colors.white,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black45.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(1, 4))
          ],
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            '$info',
            style: TextStyle(color: textColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
