import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:express_car_cleaning_co/models/DataModels/CarWashData.dart';
import 'package:express_car_cleaning_co/models/DataModels/Car_Data.dart';
import 'package:express_car_cleaning_co/constants.dart';
import 'package:express_car_cleaning_co/models/CardModels/UpcomingCarWashList.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

/// AUTHOR MARIO H.C.H.
/// DATE SEPT 27 21
/// CLASSNAME: UpcomingCarWashCard
///
/// PARAMETERS: CarWashData _carWashData: car wash data used to generate upcoming car wash list.
///             CarData _carData: used to get data about the car being washed.
///
/// DESCRIPTION: UpcomingCarWashCard is designed to contain the upcoming car wash list

class UpcomingCarWashCard extends StatelessWidget {
  const UpcomingCarWashCard({
    @required inAsyncCall,
    @required CarWashData carWashData,
    @required CarData carData,
  })  : _carWashData = carWashData,
        _carData = carData,
        _inAsyncCall = inAsyncCall;

  final CarWashData _carWashData;
  final CarData _carData;
  final bool _inAsyncCall;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ECCCBlueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'UPCOMING WASHES',
              style: TextStyle(
                fontFamily: 'Vollkorn',
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Flexible(
            // Checking to see if any car washes are scheduled
            child: ModalProgressHUD(
              color: Colors.transparent,
              inAsyncCall: _inAsyncCall,
              child: UpcomingCarWashList(
                carWashCount: _carWashData.carWashCount,
                carWashData: _carWashData,
                carData: _carData,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
