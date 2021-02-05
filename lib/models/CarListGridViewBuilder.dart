import 'package:flutter/material.dart';
import 'Car_Data.dart';
import 'ReusableCard.dart';
import 'package:cta_auto_detail/screens/scheduleCarWash.dart';

class CarListGridViewBuilder extends StatelessWidget {
  const CarListGridViewBuilder({
    @required this.carData,
  });

  final CarData carData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: carData.carsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        return CarCard(
          onPressed: () {
            Navigator.pushNamed(context, ScheduleCarWash.id);
          },
          title: carData.carsList[index].make,
        );
      },
    );
  }
}
