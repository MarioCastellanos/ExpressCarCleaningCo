import 'package:flutter/material.dart';
import 'package:cta_auto_detail/constants.dart';

class CarCard extends StatelessWidget {
  final Function onPressed;
  final String title;
  final int carIndex;
  final Color carCardColor;

  CarCard({this.onPressed, this.title, this.carIndex, this.carCardColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: carCardColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black45.withOpacity(.4),
                    spreadRadius: 4,
                    blurRadius: 2,
                    offset: Offset(4, 5))
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              Icons.car_rental,
              size: 60,
            ),
            height: 150.0,
            width: 150.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: ECCCDarkBlue,
              boxShadow: [
                BoxShadow(
                    color: Colors.black45.withOpacity(.4),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(1, 4))
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            height: 50.0,
            width: 200.0,
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
