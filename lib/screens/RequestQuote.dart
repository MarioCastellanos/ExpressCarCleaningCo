import 'package:cta_auto_detail/models/CarListGridViewBuilder.dart';
import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/constants.dart';
import '';

class RequestQuote extends StatelessWidget {
  static const String id = 'GetAQuote';

  RequestQuote({this.carData, this.selectedCarIndex});

  final CarData carData;
  final int selectedCarIndex;

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
        child: Column(
          children: [
            ReusableCard(
              childWidget: CarListGridViewBuilder(
                carData: carData,
              ),
              onPressed: () {
                print('fart');
              },
              cardColor: ECCCBlueAccent,
            ),
            ReusableCard(
              childWidget: null,
              onPressed: null,
              cardColor: ECCCBlueAccent,
            ),
            ReusableCard(
              childWidget: null,
              onPressed: null,
              cardColor: ECCCBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
