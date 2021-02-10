import 'package:cta_auto_detail/constants.dart';
import 'package:flutter/material.dart';
import 'Car_Data.dart';
import 'package:cta_auto_detail/models/CarCard.dart';

class CarListGridViewBuilder extends StatelessWidget {
  const CarListGridViewBuilder({
    @required this.onPressed,
    @required this.carData,
    @required this.selectedCarIndex,
  });

  final Function onPressed;
  final selectedCarIndex;
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
          carIndex: index,
          carCardColor: selectedCarIndex == index ? ECCCBlue : Colors.white,
          onPressed: onPressed,
          title: carData.carsList[index].make,
        );
      },
    );
  }
}
