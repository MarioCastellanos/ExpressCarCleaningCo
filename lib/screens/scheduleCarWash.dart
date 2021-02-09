import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/CarListGridViewBuilder.dart';
import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:cta_auto_detail/models/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

enum ScreenContent {
  CarSelection,
  DateAndTimeSelection,
  LocationSelection,
}

class ScheduleCarWash extends StatefulWidget {
  ScheduleCarWash({this.carData});
  final CarData carData;
  static const String id = 'ScheduleCarWash';
  @override
  _ScheduleCarWashState createState() => _ScheduleCarWashState();
}

class _ScheduleCarWashState extends State<ScheduleCarWash> {
  Map<DateTime, List> _holidays;
  Map<DateTime, List> _scheduledWashes;

  String currentTitle = '';
  String _month;
  String _date;
  String _time;

  int selectedCarIndex;
  int contentIndex;

  bool dateSelected;

  CalendarController _calendarController;

  void incrementContentSwitch() {
    contentIndex++;
  }

  @override
  void initState() {
    super.initState();
    currentTitle = 'Select A Car';
    _calendarController = CalendarController();
    contentIndex = 1;
    dateSelected = false;
    print('Car Data: ${widget.carData.carsList[0].make}');

    //widget.carData.addCar(make: 'Masserati', model: 'Quatrovole', interior: 'leather');

    _holidays = {
      DateTime(2020, 1, 1): ['New Year\'s Day'],
      DateTime(2020, 1, 6): ['Epiphany'],
      DateTime(2020, 2, 14): ['Valentine\'s Day'],
      DateTime(2020, 4, 21): ['Easter Sunday'],
      DateTime(2020, 4, 22): ['Easter Monday'],
    };

    _scheduledWashes = {
      DateTime(2020, 12, 1): ['3:00']
    };
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
        title: Text(
          '$currentTitle',
          style: TextStyle(
            color: ECCCDarkBlue,
            fontFamily: 'Vollkorn',
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            print('pop');
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ECCCBlueAccent,
            size: 36,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: contentSwitch(contentIndex),
          ),
        ),
      ),
    );
  }

  /// Name: contentSwitch
  /// Parameters: takes an Integer that represents what stage the user is in
  ///             scheduling a car wash.
  ///
  /// Function: Switches the content on the screen and sends a booking to the bookings database
  ///           ( Need to check for collision for each new request)
  ///
  /// Returns: List of widgets representing the current content

  List<Widget> contentSwitch(int index) {
    // content switch
    switch (index) {

      // user car selection
      case 1:
        {
          currentTitle = 'Select A Car';
          return <Widget>[
            // Car List widget
            ReusableCard(
              childWidget: CarListGridViewBuilder(
                carData: widget.carData,
              ),
              onPressed: () {
                print('carSelected');
              },
              cardColor: ECCCBlueAccent,
            ),
            Row(
              children: [
                ReusableCard(
                  childWidget: Text(
                    'Guest Car',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    print('Ohh Uhh im in danger');
                  },
                  cardColor: ECCCBlueAccent,
                ),
                ReusableCard(
                  childWidget: Text(
                    'New Car',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    print('Ohh Uhh im in danger');
                  },
                  cardColor: ECCCBlueAccent,
                ),
              ],
            ),
            ContinueButton(
              title: 'Continue',
              textColor: Colors.white,
              cBColor: ECCCDarkBlue,
              onPressed: () {
                setState(() {
                  contentIndex++;
                  currentTitle = 'Select A Date';
                });
              },
            )
          ];
        }
        break;

      // user selecting time and
      case 2:
        {
          // currentTitle = 'Select A Date';
          return <Widget>[
            tableCalendarBuilder(),
            ReusableCard(
              cardColor: ECCCBlueAccent.withOpacity(.5),
              childWidget: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GridView.builder(
                  primary: false,
                  padding: EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    Widget widget;
                    switch (index) {
                      default:
                        widget = UpcomingCarWashCard(
                            childWidget: null,
                            onPressed: null,
                            cardColor: null);
                    }
                    return widget;
                  },
                ),
              ),
              onPressed: () {
                print('What the fudge');
              },
            ),
            ContinueButton(
              cBColor: ECCCBlueAccent,
              title: 'Continue',
              onPressed: () {
                print('continue');
              },
            )
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

  TableCalendar tableCalendarBuilder() {
    return TableCalendar(
      events: _scheduledWashes,
      calendarController: _calendarController,
      onDaySelected: _onDaySelected,
      calendarStyle: CalendarStyle(
        todayColor: ECCCBlueAccent,
        selectedColor: ECCCDarkBlue,
        outsideDaysVisible: true,
        // Setting the color for weekend dates
        weekendStyle: TextStyle().copyWith(color: Colors.black),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        // setting the text color for Sun and Sat on weekdays row
        weekdayStyle: TextStyle(
          color: Colors.black,
        ),
        weekendStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      holidays: _holidays,
      headerStyle: HeaderStyle(
          titleTextStyle: TextStyle(),
          decoration: BoxDecoration(
            color: ECCCBlueAccent.withOpacity(.5),
            borderRadius: BorderRadius.circular(30),
          )),
      startingDayOfWeek: StartingDayOfWeek.monday,
    );
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    setState(
      () {
        _date = day.toString().substring(8, 10);
        _month = day.toString().substring(5, 7);
        print('date $_date');
        print('month $_month');
      },
    );
  }
}

// A widget that extracts the necessary arguments from the ModalRoute.
class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final CarData args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fart'),
      ),
      body: Center(
        child: Text(args.carsList.toString()),
      ),
    );
  }
}
