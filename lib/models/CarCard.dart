import 'package:flutter/material.dart';
import 'package:cta_auto_detail/constants.dart';

class CarCard extends StatelessWidget {
  final Function onPressed;
  final String title;
  final int carIndex;
  final Color carCardColor;
  final double iconSize;

  CarCard({
    this.onPressed,
    this.title,
    this.carIndex,
    this.carCardColor,
    this.iconSize = 60,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: carCardColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black45.withOpacity(.4),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(4, 5))
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.car_rental,
              size: iconSize,
            ),
            height: 150.0,
            width: 150.0,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ECCCDarkBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            height: 50.0,
            width: 150.0,
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
