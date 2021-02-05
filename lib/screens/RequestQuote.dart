import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/constants.dart';
import '';

class RequestQuote extends StatelessWidget {
  static const String id = 'GetAQuote';

  RequestQuote({this.carData});

  final CarData carData;
  int selectedCarIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(
          iconButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ReusableCard(
            childWidget: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
              ),
              itemCount: 1, //widget.carData.carsList.length,
              itemBuilder: (BuildContext context, int index) {
                return CarCard(
                  onPressed: () {
                    print('title: ${carData.carsList[index].make}');
                    selectedCarIndex = index;
                  },
                  title: carData.carsList[index].make,
                );
              },
            ),
            onPressed: null,
            cardColor: ECCCBlueAccent,
          ),
        ));
  }
}
