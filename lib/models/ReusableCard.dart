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

class UpcomingWashList extends StatelessWidget {
  final int itemCount;
  final String car;
  final String month;
  final String date;
  final String time;
  final String package;

  const UpcomingWashList({
    this.itemCount,
    this.car,
    this.month,
    this.date,
    this.time,
    this.package,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Icon(
                        Icons.car_rental,
                        color: Colors.white,
                        size: 40,
                      ),
                      alignment: Alignment.center,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$car',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$package',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                        '$month $date',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TimeAvailabilityCard extends StatelessWidget {
  final Widget childWidget;
  final Function onPressed;
  final String scheduledTime;
  final Color cardColor;

  TimeAvailabilityCard({
    @required this.childWidget,
    @required this.onPressed,
    @required this.scheduledTime,
    @required this.cardColor,
  });

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
