import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/constants.dart';



/// Reusable Card Class

class ReusableCard extends StatelessWidget {
  final Widget childWidget;
  final Function onPressed;
  final Color cardColor;

  ReusableCard(
      {@required this.childWidget,
      @required this.onPressed,
      @required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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


class UpcomingCarWashCard extends StatelessWidget {
  final Widget childWidget;
  final Function onPressed;
  final Color cardColor;

  UpcomingCarWashCard(
      {@required this.childWidget,
        @required this.onPressed,
        @required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: childWidget),
    );
  }
}

class HalfScreenCard extends StatelessWidget {
  final Widget childWidget;

  HalfScreenCard({this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, ExpressCarWashRED],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: childWidget,
    );
  }
}

class CarCard extends StatelessWidget {
  final Function onPressed;
  final String title;
  CarCard({this.onPressed, this.title});

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
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black45.withOpacity(.4),
                    spreadRadius: 4,
                    blurRadius: 2 ,
                    offset: Offset(0, 5))
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(Icons.camera, size: 60 ,),
            height: 150.0,
            width: 150.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: ExpressCarWashREDDark,
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
