import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/main.dart';
import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/screens/RequestQuote.dart';
import 'package:cta_auto_detail/screens/profile.dart';
import 'package:cta_auto_detail/screens/scheduleCarWash.dart';
import 'package:cta_auto_detail/screens/servicesOffered.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:cta_auto_detail/models/SocialMediaIcons.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Home Screen
/// TODO : Extract data from sharedPreferences and wait for it then load screen.

class HomeScreen extends StatefulWidget {
  static const String id = 'homeScreen';
  final CarData carData = CarData();
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarData _carData;

  @override
  void initState() {
    super.initState();
    _carData = widget.carData;
    _carData.initializeCarList();
    _carData.addCar(make: 'Buggati', model: 'chiron', interior: 'Leather');
    print(_carData.carsList[0].make);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(iconButtonPressed: () {
        Navigator.pop(context);
      }, profileButtonPressed: () {
        Navigator.pushNamed(context, ProfileScreen.id,
            arguments: ScreenArguments(_carData));
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
                onPressed: () {
                  Navigator.pushNamed(context, ScheduleCarWash.id,
                      arguments: ScreenArguments(_carData));
                },
                cardColor: ECCCBlueAccent,
              ),
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
                          arguments: ScreenArguments(_carData));
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
              Expanded(
                child: UpcomingCarWashCard(
                  cardColor: ECCCBlueAccent,
                  onPressed: () {
                    print('Upcoming washes');
                  },
                  childWidget: Text(
                    'UPCOMING WASHES',
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
              SocialMediaIcons()
            ],
          ),
        ),
      ),
    );
  }
}
