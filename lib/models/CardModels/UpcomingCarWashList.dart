import 'package:express_car_cleaning_co/models/DataModels/CarWashData.dart';
import 'package:flutter/material.dart';
import 'package:express_car_cleaning_co/models/Buttons/CarWashListTile.dart';
import 'package:express_car_cleaning_co/models/DataModels/Car_Data.dart';

class UpcomingCarWashList extends StatelessWidget {
  // the
  final int carWashCount;

  // List of carWashData
  final CarWashData carWashData;

  // CarData to generate car wash list.
  final CarData carData;

  const UpcomingCarWashList({
    @required this.carWashCount,
    @required this.carWashData,
    @required this.carData,
  });
  @override
  Widget build(BuildContext context) {
    return carWashCount == 0
        ? GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: carWashCount,
                itemBuilder: (context, index) {
                  print(
                      'CarWashData.carWashCount: ${carWashData.carWashCount}');
                  return CarWashListTile(
                    index: index + 1,
                    car: 'car',
                    month: '01',
                    date: '13',
                    package: 'Ruby',
                  );
                  //  car: car, package: package, month: month, date: date);
                },
              ),
            ),
          )
        : Center(
            child: Text(
              'No car washes scheduled',
              style: TextStyle(
                fontFamily: 'Vollkorn',
                fontSize: 25,
                color: Colors.black.withOpacity(.5),
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
          );
  }
}
