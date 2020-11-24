import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleCarWash extends StatefulWidget {
  static const String id = 'ScheduleCarWash';
  @override
  _ScheduleCarWashState createState() => _ScheduleCarWashState();
}



final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};


enum ScreenContent {
  CarSelection,
  DateAndTimeSelection,
  LocationSelection,
}

class _ScheduleCarWashState extends State<ScheduleCarWash> {
  int contentIndex;
  CarData carData;
  CalendarController _calendarController;


  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    contentIndex = 2;
    carData = CarData();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(height: 25, width: 25, child: Image.asset('images/RedCarIconAppBar.png')),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            print('pop');
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ExpressCarWashRedAccent,
            size: 36,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: contentSwitch(contentIndex),
        ),
      ),
    );
  }

  
  /// Name: contentSwitch
  /// Parameters: takes an Integer that represents what stage the user is in
  ///             scheduling a car wash.
  ///
  /// Function:
  /// Returns:

  List<Widget> contentSwitch(int index) {
    // content switch
    switch (index) {

      // user car selection
      case 1:
        {
          return <Widget>[
            ReusableCard(
              onPressed: () {
                print('fart');
              },
              cardColor: ExpressCarWashRedAccent,
              childWidget: Text(
                'Select a vehicle',
                style: TextStyle(
                  fontSize: 45,
                  fontFamily: 'Vollkorn',
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ReusableCard(
              childWidget: GridView.builder(
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
              ),
              onPressed: (){
                print('fart');
              },
              cardColor: Colors.red,
            ),
          ];
        }
        break;

      // user selecting time and
      case 2:
        {
          return <Widget>[
            TableCalendar(
              calendarController: _calendarController,
              calendarStyle: CalendarStyle(
                todayColor: ExpressCarWashRedAccent,
                selectedColor: ExpressCarWashREDDark,

              ),
              holidays: _holidays,
              headerStyle: HeaderStyle(
                decoration: BoxDecoration(
                  color: ExpressCarWashRedAccent,
                  borderRadius: BorderRadius.circular(10),
                  )
                )
              ),

          ];
        }
        break;

      case 3:
        {
          return <Widget>[];
        }
        break;
    }
    return <Widget>[];
  }
}
