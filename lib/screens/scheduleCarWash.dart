import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:cta_auto_detail/models/RoundedButton.dart';
import 'package:cta_auto_detail/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/models/CarCard.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cta_auto_detail/screens/PopUpScreen.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cta_auto_detail/models/CarWashPackage.dart';
import 'package:cta_auto_detail/models/WaveCustomPainter.dart';

/// TODO : REFACTOR CODE
///

class ScheduleCarWash extends StatefulWidget {
  ScheduleCarWash({this.carData});
  final CarData carData;
  static const String id = 'ScheduleCarWash';
  @override
  _ScheduleCarWashState createState() => _ScheduleCarWashState();
}

class _ScheduleCarWashState extends State<ScheduleCarWash> {
  Color selectedDateColor = ECCCBlue;
  Color todayDateColor = ECCCDarkBlue;

  List<String> packageNameList = [
    'Diamond',
    'Sapphire',
    'Ruby',
    'Emerald',
  ];
  List<Text> packageList = [
    kDiamondPackageDetails,
    kSapphirePackageDetails,
    kRubyPackageDetails,
    kEmeraldPackageDetails,
  ];

  List<TextStyle> packageTextStyleList = [
    kDiamondTextStyle,
    kSapphireTextStyle,
    kRubyTextStyle,
    kEmeraldTextStyle,
  ];

  Map<DateTime, List> _holidays;
  Map<DateTime, List> _scheduledWashes;

  String currentTitle = '';
  int _month = -1;
  int _date = -1;
  int _time;
  int packageNumber;

  int todayTime;
  int timesAvailable;

  bool dateSelected = false;
  bool timeSelected = false;
  bool packageSelected = false;
  int scheduledTime = -1;
  int selectedCarIndex;
  String selectedCarMake;
  String selectedCarModel;
  String selectedCarTrim;
  int contentIndex;

  Color initColor = Diamond;
  Color endColor = Ruby;

  Color packageColor = Colors.white;

  CalendarController _calendarController;

  void getFocusDayAvailableTime() {
    String selectedTime = _calendarController.focusedDay.toString();
    DateTime now = DateTime.now();
    DateTime day = _calendarController.focusedDay;
    todayTime = int.parse(now.toString().substring(11, 13));
    int nowMonth = int.parse(now.toString().substring(5, 7));
    int nowDay = int.parse(now.toString().substring(8, 10));
    int dayMonth = int.parse(day.toString().substring(5, 7));
    int dayDay = int.parse(day.toString().substring(8, 10));

    if (nowMonth == dayMonth && nowDay == dayDay) {
      getTodayAvailableTime();
    } else {
      timesAvailable = 9;
    }
  }

  void getTodayAvailableTime() {
    DateTime now = DateTime.now();
    todayTime = int.parse(now.toString().substring(11, 13));
    print("current time : $todayTime");
    if (todayTime < 9) {
      timesAvailable = 9;
    } else if (todayTime < 15) {
      timesAvailable = 17 - 2 - todayTime;
    } else {
      timesAvailable = 0;
    }
  }

  @override
  void initState() {
    super.initState();
    getTodayAvailableTime();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    currentTitle = 'Select A Car';
    _calendarController = CalendarController();

    contentIndex = 1;
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
          return <Widget>[
            tableCalendarBuilder(),
            ReusableCard(
              cardColor: ECCCBlueAccent.withOpacity(.5),
              childWidget: timeAvailabilityGenerator(),
              onPressed: () {
                print('What the fudge');
              },
            ),
            ContinueButton(
              title: 'Continue',
              textColor: Colors.white,
              cBColor: dateSelected != false && timeSelected != false
                  ? ECCCBlue
                  : Colors.grey,
              onPressed: dateSelected != false && timeSelected != false
                  ? () {
                      setState(() {
                        contentIndex++;
                        currentTitle = 'Select Car Wash Package';
                      });
                    }
                  : () {
                      setState(() {
                        currentTitle = 'Select a Date & Time';
                      });
                    },
            )
          ];
        }
        break;

      // User selects a car wash package
      case 3:
        {
          return <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: ECCCBlueAccent.withOpacity(.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Saved Locations',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Vollkorn',
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                ReusableCard(
                  childWidget: Text(
                    'Guest Location',
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
                    'New Location',
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
            Flexible(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: packageColor,
                ),
                child: Swiper(
                  onTap: (int index) {
                    packageNumber = index;
                    print('PackageNumber = $packageNumber');
                    setState(() {
                      packageSelected = true;
                      packageColor = Colors.blue;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: ECCCBlueAccent.withOpacity(.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CustomPaint(
                                painter: Wave(),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 30.0,
                                      right: 8.0,
                                      bottom: 8.0,
                                      left: 8.0),
                                  child: CarWashPackage(
                                    packageTitle: packageNameList[index],
                                    packageTitleStyle:
                                        packageTextStyleList[index],
                                    packageDetails: packageList[index],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 4,
                  loop: false,
                  outer: true,
                  pagination: new SwiperPagination(
                    margin: EdgeInsets.all(10),
                  ),
                  control: null,
                ),
              ),
            ),
            ContinueButton(
                title: 'Schedule Wash',
                textColor: Colors.white,
                cBColor: packageSelected == true ? ECCCBlue : Colors.grey,
                onPressed: packageSelected == true
                    ? () {
                        print('car wash scheduled');
                        Navigator.pop(context, [
                          selectedCarIndex,
                          _month,
                          _date,
                          _time,
                          packageNumber,
                        ]);
                      }
                    : () {
                        print('No package Selected');
                      })
          ];
        }
        break;
      case 4:
        {
          return <Widget>[
            Expanded(
                child: Container(
              color: Colors.blue,
            ))
          ];
        }
        break;
    }
    return <Widget>[];
  }

  Widget timeAvailabilityGenerator() {
    if (timesAvailable == 0) {
      return Center(
          child: Text(
        'No times available for  ${_calendarController.focusedDay.toString().substring(0, 10)}',
        style: TextStyle(
          fontFamily: 'Vollkorn',
          fontSize: 30,
          color: ECCCDarkBlue,
        ),
      ));
    }
    return MediaQuery.removePadding(
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
        itemCount: timesAvailable,
        itemBuilder: (BuildContext context, int index) {
          return TimeAvailabilityCard(
            scheduledTime: (index + timesAvailable).toString(),
            childWidget: Center(
              child: index == 3
                  ? Text('12:00')
                  : Text(
                      '${(index + timesAvailable) % 12}:00  ',
                    ),
            ),
            onPressed: () {
              print('Selected time is : ${index + 9}');
              _time = index + 9;
              setState(() {
                scheduledTime = (index + 9) % 12;
              });
              print(scheduledTime);
              timeSelected = true;
            },
            cardColor:
                scheduledTime == ((index + 9) % 12) ? ECCCDarkBlue : ECCCBlue,
          );
        },
      ),
    );
  }

  TableCalendar tableCalendarBuilder() {
    return TableCalendar(
      events: _scheduledWashes,
      calendarController: _calendarController,
      onDaySelected: _onDaySelected,
      calendarStyle: CalendarStyle(
        todayColor: todayDateColor,
        selectedColor: selectedDateColor,
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
    DateTime now = DateTime.now();
    todayTime = int.parse(now.toString().substring(11, 13));
    int nowMonth = int.parse(now.toString().substring(5, 7));
    int nowDay = int.parse(now.toString().substring(8, 10));

    int dayMonth = int.parse(day.toString().substring(5, 7));
    int dayDay = int.parse(day.toString().substring(8, 10));

    setState(
      () {
        if (dayMonth < nowMonth) {
          selectedDateColor = Colors.red;
          timesAvailable = 0;
          dateSelected = false;
          selectedDateColor = Colors.red;
          _month = -1;
          _date = -1;
        } else if (dayMonth == nowMonth && dayDay < nowDay) {
          dateSelected = false;
          timesAvailable = 0;
          selectedDateColor = Colors.red;
          _month = -1;
          _date = -1;
        } else {
          dateSelected = true;
          getFocusDayAvailableTime();
          _month = dayMonth;
          _date = dayDay;
          selectedDateColor = ECCCBlue;
        }
      },
    );
  }
}
