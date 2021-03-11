import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:cta_auto_detail/models/RoundedButton.dart';
import 'package:cta_auto_detail/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/models/CarCard.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cta_auto_detail/screens/PopUpScreen.dart';

/// TODO 3: ADD case 3 for package selection

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
  int _time;
  int selectedCarIndex;
  String selectedCarMake;
  String selectedCarModel;
  String selectedCarTrim;
  int contentIndex;
  bool dateSelected;
  CalendarController _calendarController;
  ScrollController scrollController = ScrollController();

  void incrementContentSwitch() {
    contentIndex++;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    currentTitle = 'Select A Car';
    _calendarController = CalendarController();
    contentIndex = 1;
    dateSelected = false;
    selectedCarIndex = -1;
    _holidays = {
      DateTime(2021, 1, 1): ['New Year\'s Day'],
    };

    _scheduledWashes = {
      DateTime(2021, 12, 1): ['3:00']
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
            if (contentIndex > 1) {
              setState(() {
                contentIndex--;
              });
            } else {
              Navigator.pop(context);
            }
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ECCCBlueAccent,
            size: 36,
          ),
        ),
        actions: [
          contentIndex > 1
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 36,
                    color: ECCCBlueAccent,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ProfileScreen.id);
                  },
                  icon: Icon(
                    Icons.person,
                    size: 36,
                    color: ECCCBlueAccent,
                  ),
                )
        ],
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

  List<Widget> contentSwitch(int screenIndex) {
    // content switch
    switch (screenIndex) {
      // user car selection
      case 1:
        {
          currentTitle = 'Select A Car';
          return <Widget>[
            // Car List widget
            ReusableCard(
              childWidget: GridView.builder(
                itemCount: widget.carData.carsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CarCard(
                    carIndex: index,
                    carCardColor:
                        selectedCarIndex == index ? ECCCBlue : Colors.white,
                    onPressed: () {
                      if (index == selectedCarIndex) {
                        setState(() {
                          selectedCarIndex = -1;
                        });
                      } else {
                        setState(() {
                          selectedCarIndex = index;
                        });
                      }
                      selectedCarMake = widget.carData.carsList[index].make;
                      selectedCarModel = widget.carData.carsList[index].model;
                      selectedCarTrim = widget.carData.carsList[index].interior;
                    },
                    title: widget.carData.carsList[index].make,
                  );
                },
              ),
              onPressed: () {},
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
                  onPressed: () async {
                    var car = await Navigator.pushNamed(context, PopUpCard.id);
                    if (car != null) {
                      List<String> carInfoList = car;
                      setState(() {
                        selectedCarMake = carInfoList[1];
                        selectedCarModel = carInfoList[0];
                        selectedCarTrim = carInfoList[2];
                        contentIndex++;
                        currentTitle = 'Select A Date';
                      });
                    }
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
                  onPressed: () async {
                    var car = await Navigator.pushNamed(context, PopUpCard.id);
                    if (car != null) {
                      List<String> carInfoList = car;
                      setState(() {
                        widget.carData.addCar(
                          model: carInfoList[0],
                          make: carInfoList[1],
                          interior: carInfoList[2],
                          newCar: true,
                        );
                        selectedCarMake = carInfoList[1];
                        selectedCarModel = carInfoList[0];
                        selectedCarTrim = carInfoList[2];
                        contentIndex++;
                        currentTitle = 'Select A Date';
                      });
                    }
                  },
                  cardColor: ECCCBlueAccent,
                ),
              ],
            ),
            ContinueButton(
              title: 'Continue',
              textColor: Colors.white,
              cBColor: selectedCarIndex != -1 ? ECCCBlue : Colors.grey,
              onPressed: () {
                print(selectedCarMake);
                print(selectedCarModel);
                print(selectedCarTrim);
                setState(() {
                  contentIndex++;
                  currentTitle = 'Select A Date';
                });
              },
            )
          ];
        }
        break;

      // user selecting date and time
      case 2:
        {
          int time = 9;
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
                      childAspectRatio: 1,
                      crossAxisCount: 3),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    Widget widget;
                    switch (index) {
                      default:
                        widget = UpcomingCarWashCard(
                          scheduledTime: time.toString(),
                          childWidget: Center(
                            child: Text(
                              '$time:00  ',
                            ),
                          ),
                          onPressed: () {
                            print('Selected time is :');
                          },
                          cardColor: ECCCBlue,
                        );
                    }
                    time++;
                    return widget;
                  },
                ),
              ),
              onPressed: () {
                print('What the fudge');
              },
            ),
            ContinueButton(
              title: 'Continue',
              textColor: Colors.white,
              cBColor: ECCCDarkBlue,
              onPressed: () {
                setState(() {
                  contentIndex++;
                  currentTitle = 'Select Car Wash Package';
                });
              },
            )
          ];
        }
        break;

      case 3:
        {
          return <Widget>[
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
                controller: scrollController,
                child: ListView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Card(
                      color: ECCCBlueAccent,
                      child: Container(
                        width: 400,
                        child: kDiamondPackageDetails,
                      ),
                    ),
                    Card(
                      color: ECCCBlueAccent,
                      child: Container(
                        width: 400,
                        child: kDiamondPackageDetails,
                      ),
                    ),
                    Card(
                      color: ECCCBlueAccent,
                      child: Container(
                        width: 400,
                        child: kDiamondPackageDetails,
                      ),
                    ),
                    Card(
                      color: ECCCBlueAccent,
                      child: Container(
                        width: 400,
                        child: kDiamondPackageDetails,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ContinueButton(
              title: 'Schedule Wash',
              textColor: Colors.white,
              cBColor: ECCCDarkBlue,
              onPressed: () {
                print('car wash scheduled');
                Navigator.pop(context);
              },
            )
          ];
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
        print(_calendarController.focusedDay);
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
