import 'package:flutter/material.dart';

class CarWashListTile extends StatelessWidget {
  const CarWashListTile({
    @required this.index,
    @required this.car,
    @required this.package,
    @required this.month,
    @required this.date,
  });

  final int index;
  final String car;
  final String package;
  final String month;
  final String date;

  @override
  Widget build(BuildContext context) {
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
              child: Text(
                '$index',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              alignment: Alignment.center,
            ),
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
  }
}
