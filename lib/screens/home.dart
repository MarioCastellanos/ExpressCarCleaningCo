import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/screens/profile.dart';
import 'package:cta_auto_detail/screens/scheduleCarWash.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Home Screen

class HomeScreen extends StatefulWidget {
  static const String id = 'homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(iconButtonPressed: () {
        Navigator.pop(context);
      }, profileButtonPressed: () {
        Navigator.pushNamed(context, ProfileScreen.id);
      }),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ReusableCard(
                childWidget: Center(
                  child: Text(
                    'SCHEDULE A WASH',
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
                  Navigator.pushNamed(context, ScheduleCarWash.id);
                },
                cardColor: ExpressCarWashRedAccent,
              ),
              Row(
                children: [
                  ReusableCard(
                      cardColor: ExpressCarWashRedAccent,
                      onPressed: () {
                        print('SERVICES OFFERED');
                      },
                      childWidget: Center(
                        child: Text(
                          'SERVICES OFFERED',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'Vollkorn',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )),
                  ReusableCard(
                      cardColor: ExpressCarWashRedAccent,
                      onPressed: () {
                        print('GET A QUOTE');
                      },
                      childWidget: Center(
                        child: Text(
                          'GET A QUOTE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'Vollkorn',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )),
                ],
              ),
              Expanded(
                child: UpcomingCarWashCard(
                    cardColor: ExpressCarWashRedAccent,
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
                    )),
              ),
              SocialMediaIcons()
            ],
          ),
        ),
      ),
    );
  }
}

class SocialMediaIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ExpressCarWashRedAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(.5),
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(0, 3))
              ],
            ),
            child: FaIcon(
              FontAwesomeIcons.facebook,
              color: Colors.black,
              size: 30,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ExpressCarWashRedAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(.5),
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(0, 3))
              ],
            ),
            child: FaIcon(
              FontAwesomeIcons.instagram,
              color: Colors.black,
              size: 30,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ExpressCarWashRedAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(.5),
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(0, 3))
              ],
            ),
            child: FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
