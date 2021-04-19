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
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'homeScreen';
  final CarData carData = CarData();
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> _scheduledWashInfo = [];
  CarData _carData;

  @override
  void initState() {
    super.initState();
    _carData = widget.carData;
    _carData.initializeCarList();
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
                onPressed: () async {
                  var carWashInfoList = await Navigator.pushNamed(
                    context,
                    ScheduleCarWash.id,
                    arguments: ScreenArguments(
                      _carData,
                    ),
                  );
                  setState(() {
                    _scheduledWashInfo.addAll(carWashInfoList);
                    print(_scheduledWashInfo);
                  });
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
              SizedBox(
                height: 5,
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: ECCCBlueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                        child: _scheduledWashInfo.length == 0
                            ? Center(
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
                              )
                            : UpcomingWashList(),
                      ),
                    ],
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
