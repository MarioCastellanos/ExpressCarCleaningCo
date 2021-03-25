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

  final List<String> packageNameList = [
    'Diamond',
    'Sapphire',
    'Ruby',
    'Emerald',
  ];
  final List<Text> packageList = [
    kDiamondPackageDetails,
    kSapphirePackageDetails,
    kRubyPackageDetails,
    kEmeraldPackageDetails,
  ];

  final List<TextStyle> packageTextStyleList = [
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

  bool dateSelected = false;
  bool timeSelected = false;
  int scheduledTime = -1;
  int selectedCarIndex;
  String selectedCarMake;
  String selectedCarModel;
  String selectedCarTrim;
  int contentIndex;
  CalendarController _calendarController;
  ScrollController scrollController = ScrollController();

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
          int time = 9;
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
                    return UpcomingCarWashCard(
                      scheduledTime: (index + 9).toString(),
                      childWidget: Center(
                        child: Text(
                          '${(index + 9) % 12}:00  ',
                        ),
                      ),
                      onPressed: () {
                        print('Selected time is : ${index + 9}');
                        setState(() {
                          scheduledTime = (index + 9) % 12;
                        });
                        print(scheduledTime);
                        timeSelected = true;
                      },
                      cardColor: scheduledTime == ((index + 9) % 12)
                          ? ECCCDarkBlue
                          : ECCCBlue,
                    );
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

      case 3:
        {
          return <Widget>[
            Flexible(
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            color: ECCCBlueAccent.withOpacity(.5),
                            child: CustomPaint(
                              painter: Wave(),
                              child: Container(
                                width: 100.0,
                                height: 120.0,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 30.0),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
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
    int nowMonth = int.parse(now.toString().substring(5, 7));
    int nowDay = int.parse(now.toString().substring(8, 10));

    int dayMonth = int.parse(day.toString().substring(5, 7));
    int dayDay = int.parse(day.toString().substring(8, 10));

    setState(
      () {
        if (dayMonth < nowMonth) {
          selectedDateColor = Colors.red;
          dateSelected = false;
        } else if (dayMonth == nowMonth && dayDay < nowDay) {
          dateSelected = false;
          selectedDateColor = Colors.red;
        } else {
          dateSelected = true;
          _month = dayMonth;
          _date = dayDay;
          selectedDateColor = ECCCBlue;
        }
      },
    );
  }
}

class Wave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [ECCCDarkBlue, Colors.blueAccent, ECCCDarkBlue],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = new Paint()
      ..shader = gradient.createShader(colorBounds);

    Path path = Path();
    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
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
