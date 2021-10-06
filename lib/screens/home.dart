import 'package:express_car_cleaning_co/constants.dart';
import 'package:express_car_cleaning_co/ScreenArguments.dart';
import 'package:express_car_cleaning_co/models/DataModels/Address_Data.dart';
import 'package:express_car_cleaning_co/models/DataModels/CarWashData.dart';
import 'package:express_car_cleaning_co/models/DataModels/Car_Data.dart';
import 'package:express_car_cleaning_co/screens/RequestQuote.dart';
import 'package:express_car_cleaning_co/screens/profile.dart';
import 'package:express_car_cleaning_co/screens/scheduleCarWash.dart';
import 'package:express_car_cleaning_co/screens/servicesOffered.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:express_car_cleaning_co/models/CardModels/ReusableCard.dart';
import 'package:flutter/services.dart';
import 'package:express_car_cleaning_co/AppBarFunction.dart';
import 'package:express_car_cleaning_co/models/CardModels/UpcomingCarWashCard.dart';

/// CLASSNAME: HomeScreen
///
/// PARAMETERS: carData: data pertaining to users cars fleet
///             addressData: data pertaining to users address book
///             carWashData data pertaining to the carwashes scheduled by the user.
///
/// DESCRIPTION: The first screen the user experiences and interacts with. I tried to make it
///              as intuitive as i possibly could. The user is prompted with several options:
///              access their profile
///              schedule a car wash,
///              view the services offered,
///              request a quote,
///              view any upcoming car washes.
///

class HomeScreen extends StatefulWidget {
  static const String id = 'homeScreen';
  final CarData carData = CarData();
  final AddressData addressData = AddressData();
  final CarWashData carWashData = CarWashData();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// List that contains all the upcoming car wash info. It is organized to
  /// be subdivided in lengths of 5 items. Each item represents a different
  /// aspect of the car wash. This organization pattern is repeated.
  /// Item 0: selectedCarIndex, : the index in the our carData's cars list that
  ///                             represents the car being washed.
  /// Item 1: month             : The month the car wash is occurring in.
  /// Item 2: date              : they day of the moth the car wash is scheduled
  /// Item 3: time              : the time for the car wash.
  /// Item 4: packageNumber     : the package selected for the car wash.
  ///

  List<int> _scheduledWashInfo = [];
  // CarData used to access users car fleet
  CarData _carData;
  // AddressData used to access users address list
  AddressData _addressData;
  // Used to access the users scheduled car washes
  CarWashData _carWashData;
  // var CarWasInfoList is used to catch the list of Car wash Info to be used
  // for Upcoming car wash lists.
  var carWashInfoList;
  // boolean used to track the initialization of the car wash and stop the modal progress hud

  @override
  void initState() {
    super.initState();
    _carData = widget.carData;
    _carData.initializeCarList();
    _addressData = widget.addressData;
    _addressData.initializeAddressList();
    _carWashData = widget.carWashData;
    _carWashData.initializeCarWashList();
    print('Is carWashData empty : ${_carWashData.isEmpty}');
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          iconButtonPressed: () {
            Navigator.pop(context);
          },
          needsProfileButton: true,
          profileButtonPressed: () {
            Navigator.pushNamed(context, ProfileScreen.id,
                arguments:
                    ScreenArguments(_carData, _addressData, _carWashData));
          }),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ReusableCard(
                childWidget: Center(
                  child: Text(
                    'SCHEDULE WASH',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontFamily: 'Vollkorn',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                onPressed: () async {
                  carWashInfoList = await Navigator.pushNamed(
                    context,
                    ScheduleCarWash.id,
                    arguments:
                        ScreenArguments(_carData, _addressData, _carWashData),
                  );
                  if (carWashInfoList != null) {
                    setState(() {
                      _scheduledWashInfo.addAll(carWashInfoList);
                      print(_scheduledWashInfo);
                    });
                  }
                },
                cardColor: ECCCBlueAccent,
              ),

              /// Services Offered and Request a Quote buttons.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableCard(
                    cardColor: ECCCBlueAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, ServicesOffered.id);
                    },
                    childWidget: Center(
                      child: Text(
                        'SERVICES OFFERED',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Vollkorn',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  ReusableCard(
                    cardColor: ECCCBlueAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, RequestQuote.id,
                          arguments: ScreenArguments(
                              _carData, _addressData, _carWashData));
                    },
                    childWidget: Center(
                      child: Text(
                        'REQUEST \n  QUOTE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Vollkorn',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Flexible(
                child: UpcomingCarWashCard(
                  inAsyncCall: _carWashData.isEmpty,
                  carWashData: _carWashData,
                  carData: _carData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
