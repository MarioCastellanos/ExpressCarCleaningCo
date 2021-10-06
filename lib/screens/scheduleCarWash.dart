import 'package:express_car_cleaning_co/constants.dart';
import 'package:express_car_cleaning_co/models/DataModels/Address_Data.dart';
import 'package:express_car_cleaning_co/models/Buttons/TimeTileButton.dart';
import 'package:express_car_cleaning_co/models/DataModels/Car_Data.dart';
import 'package:express_car_cleaning_co/models/CardModels/ReusableCard.dart';
import 'package:express_car_cleaning_co/models/Buttons/ContinueButton.dart';
import 'package:express_car_cleaning_co/models/Objects/Address.dart';
import 'package:express_car_cleaning_co/models/Objects/CarWash.dart';
import 'package:express_car_cleaning_co/models/TextFieldModels/AddressFieldForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:express_car_cleaning_co/models/CardModels/CarCard.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:express_car_cleaning_co/screens/CarCreationCardPopUp.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:express_car_cleaning_co/models/Objects/CarWashPackage.dart';
import 'package:express_car_cleaning_co/models/WaveCustomPainter.dart';
import 'package:express_car_cleaning_co/models/Buttons/addressListTile.dart';
import 'package:express_car_cleaning_co/models/DataModels/CarWashData.dart';
import 'package:express_car_cleaning_co/models/Objects/Car.dart';

/// CLASSNAME: ScheduleCarWash
///
///
/// PARAMETERS: carDara: information and access to the car list
///             addressData: a reference to the Address_Data class representing
///                          the users current car list.
///
/// DESCRIPTION: Screen that allows a user to select the car to be washed, the date and
///               time using TableCalendar api.

/// TODO : Handle case where cars list is empty.
/// TODO: Comment up code

class ScheduleCarWash extends StatefulWidget {
  ScheduleCarWash({
    this.carData,
    this.addressData,
    this.carWashData,
  });
  // CarData used for displaying users cars.
  final CarData carData;
  // Used to generate the list of saved locations
  final AddressData addressData;

  //Used to add new carWash object to the car wash list to the carWashData
  final CarWashData carWashData;
  static const String id = 'ScheduleCarWash';
  @override
  _ScheduleCarWashState createState() => _ScheduleCarWashState();
}

class _ScheduleCarWashState extends State<ScheduleCarWash> {
  //Setting the final date that the user can access on the calendar.
  DateTime lastDay = DateTime.parse("2069-07-20 20:18:04Z");

  // the current month of the focus day set to -1 by default;
  int _month = -1;
  // current date for the focus day set to -1 by default;
  int _date = -1;
  // current time selected for car wash set to -1 by default
  int _timeSelectedForWash = -1;
  // Address the current location picked by the user for the car wash.
  Address _address = Address('726 tressy Ave', 'CA', 'Glendora', '91740');
  // an int representing the index of the selected package set to -1 by default
  int packageNumber;

  //the current time
  int currentHour;
  // amount of time slots available;
  int timeSlotsAvailability = 0;
  // the time tile button index selected by the user set to -1 by default
  int timeTileButtonIndex = -1;
  // the index of the selected carCard
  int selectedCarCardIndex;
  // the index of the address selected by the user in the savedLocationsWidget
  int selectedAddressIndex;

  // determins if a date has been selected by the user and allows for the continue button to be pressed
  bool dateSelected = false;
  // used to validate that the user has selected a timeTileButton
  bool timeTileButtonSelected = false;
  // used to validate that the user has selected and address.
  bool addressSelected = false;
  // used to validate that the user has selected a package
  bool packageSelected = false;

  // The current title to be displayed in the app bar
  String currentTitle = '';
  // the make of car selected by user
  String selectedCarMake;
  // the model of car selected by user
  String selectedCarModel;
  // the interior trim of the car selected by the user
  String selectedCarTrim;

  // the street address to be used for guest parking or
  String streetAddress = '';
  String city = '';
  String state = '';
  String zipCode = '';

  bool addressEntered = false;

  /// The contentIndex represents what stage in the car was schudeluing process
  /// the user is in from 0 - 3:
  /// 0: user is selecting a car from their fleet to wash
  /// 1: user is selecting a date and time for their wash
  /// 2: user is selecting a location and package for their wash
  /// 3: confirmation page (needs implementation)
  int contentIndex;

  // Global form used to access the TextFieldForm with the users street address
  final _streetAddressFormKey = GlobalKey<FormState>();
  // Global form used to access the TextFieldForm with the users city
  final _cityFormKey = GlobalKey<FormState>();
  //Global form used to access the TextFieldForm with the users state
  final _stateFormKey = GlobalKey<FormState>();
  //Global form used to access the TextFieldForm with the users zip code
  final _zipFormKey = GlobalKey<FormState>();

  // _selectedDay
  DateTime _selectedDay = DateTime.now();
  DateTime _focusDate = DateTime.now();
  DateTime _firstDate = DateTime.now();

  /// List of car wash package names
  List<String> packageNameList = [
    'Diamond',
    'Sapphire',
    'Ruby',
    'Emerald',
  ];
  // List of package details
  List<Text> packageDetailsList = [
    kDiamondPackageDetails,
    kSapphirePackageDetails,
    kRubyPackageDetails,
    kEmeraldPackageDetails,
  ];
  // List of package textStyles
  List<TextStyle> packageTextStyleList = [
    kDiamondTextStyle,
    kSapphireTextStyle,
    kRubyTextStyle,
    kEmeraldTextStyle,
  ];

  @override
  void initState() {
    super.initState();
    // Getting the time availability count for today's date.
    timeSlotsAvailability = getTodayAvailableTime();
    // Restricting orientation to portrait mode.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Setting the current title to be displayed in the app bar
    currentTitle = 'Select A Car';
    // Setting the content index to one so user can select car.
    contentIndex = 1;
    // Setting the selected car index to -1 so that no car appears as selected.
    selectedCarCardIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // the title being displayed in the app bar to tell the user what to do.
          '$currentTitle',
          style: TextStyle(
            color: ECCCDarkBlue,
            fontFamily: 'Vollkorn',
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        // Icon button used to return user to previous car wash selection
        // if the used on the first car wash selection screen the user will
        // be redirected back to the home screen
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
          // Used to cancel the car wash scheduling process
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
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
            /// Car List widget
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
                    // Determining the color of the Carcard, if the card is selectd it will turn
                    // dark
                    carCardColor:
                        selectedCarCardIndex == index ? ECCCBlue : Colors.white,
                    // Based on if the CarCard is selected will change the behavior of the
                    // CarCard onPressed:
                    // if the CarCard's index matches the selected index(indicating that it is the selected car)
                    // the CarCard will set the index back to -1 deselecting the CarCard
                    // Otherwise the CarCard will set the selectedCarCardIndex to its index
                    // as well as the appropriate car selected info to be returned to the user.
                    onPressed: () {
                      if (index == selectedCarCardIndex) {
                        setState(() {
                          selectedCarCardIndex = -1;
                          selectedCarMake = '';
                          selectedCarModel = '';
                          selectedCarTrim = '';
                        });
                      } else {
                        setState(() {
                          selectedCarCardIndex = index;
                          selectedCarMake = widget.carData.carsList[index].make;
                          selectedCarModel =
                              widget.carData.carsList[index].model;
                          selectedCarTrim =
                              widget.carData.carsList[index].interior;
                        });
                      }
                    },
                    title: widget.carData.carsList[index].make,
                  );
                },
              ),
              onPressed: () {},
              cardColor: ECCCBlueAccent.withOpacity(.5),
            ),

            // Guest Car and New Car buttons
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
                    var car = await Navigator.pushNamed(
                        context, CarCreationCardPopUp.id);
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

                // The user has selected a car wash for a new car to schedule a car wash for
                ReusableCard(
                  // New Car Text on the button
                  childWidget: Text(
                    'New Car',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    // catching the new car returned from PopUpCard
                    var car = await Navigator.pushNamed(
                        context, CarCreationCardPopUp.id);
                    if (car != null) {
                      List<String> carInfoList = car;
                      setState(() {
                        // adding the car to to the users car fleet
                        widget.carData.addCar(
                          model: carInfoList[0],
                          make: carInfoList[1],
                          interior: carInfoList[2],
                          newCar: true,
                        );
                        // setting the appropriate index for the car.
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
              activated: selectedCarCardIndex != -1,
              title: 'Continue',
              textColor: Colors.white,
              cBColor: selectedCarCardIndex != -1 ? ECCCBlue : Colors.grey,
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
        // DateTime day = DateTime.now();

        {
          return <Widget>[
            TableCalendar(
              focusedDay: _focusDate,
              firstDay: _firstDate,
              lastDay: lastDay,
              calendarStyle: CalendarStyle(
                isTodayHighlighted: false,
              ),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                /// Variables pertaining to information about today.
                // Time info for today's date
                DateTime now = DateTime.now();
                // the current hour of the day in military time;
                currentHour = now.hour;
                // the selected month
                int dayMonth = now.month;
                // the selected date
                int dayDay = now.day;

                dayMonth = selectedDay.month;
                dayDay = selectedDay.day;

                _selectedDay = selectedDay;
                _focusDate = focusedDay;
                setState(
                  () {
                    timeTileButtonIndex = -1;
                    timeTileButtonSelected = false;
                    dateSelected = true;
                    timeSlotsAvailability = getFocusDayAvailableTime();
                    _month = dayMonth;
                    _date = dayDay;
                  },
                );
              },
            ),

            /// Time Tile Button Generator
            ReusableCard(
              cardColor: ECCCDarkBlue.withOpacity(.8),
              childWidget: MediaQuery.removePadding(
                context: context,
                removeTop: true,

                /// The timeTilesButton GridView.Builder a builder variation was chosen
                /// so that a tile can be generated for the available time slots whose
                /// value is represented by _timesAvailable.
                /// Message to be displayed if no times are available for selected day
                child: timeSlotsAvailability == 0
                    ? Center(
                        child: Text(
                        'No times available for selected date.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Vollkorn',
                          fontSize: 30,
                          color: ECCCBlueAccent,
                        ),
                      ))
                    : GridView.builder(
                        primary: false,
                        padding: EdgeInsets.all(20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                            crossAxisCount: 3),
                        itemCount: timeSlotsAvailability,
                        itemBuilder: (BuildContext context, int index) {
                          return TimeTileButton(
                            timeTextWidget: Center(
                              child: getTextWidget(
                                  DateTime.now().day == _selectedDay.day,
                                  index),
                            ),
                            onPressed: () {
                              setState(() {
                                // Deselecting the current selected time if pressed twice.
                                if (timeTileButtonIndex == index) {
                                  print('Pressed same time slot');
                                  timeTileButtonIndex = -1;
                                  timeTileButtonSelected = false;
                                  _timeSelectedForWash = -1;
                                } else
                                // Setting appropriate variables to reflect user selection
                                // of timeTileButton
                                {
                                  timeTileButtonSelected = true;
                                  timeTileButtonIndex = index;
                                  _timeSelectedForWash =
                                      (index + timeSlotsAvailability) % 12;
                                }
                              });
                            },
                            tileColor: timeTileButtonIndex == index
                                ? ECCCDarkBlue
                                : ECCCBlueAccent,
                          );
                        },
                      ),
              ),
              onPressed: () {
                ///Do nothing
              },
            ),

            ///
            ContinueButton(
              title: 'Continue',
              activated:
                  dateSelected != false && timeTileButtonSelected != false,
              textColor: Colors.white,
              cBColor: dateSelected != false && timeTileButtonSelected != false
                  ? ECCCBlue
                  : Colors.grey,
              onPressed:
                  dateSelected != false && timeTileButtonSelected != false
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
            /// Saved Locations Widget
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
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: widget.addressData.addressCount,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: AddressListTile(
                                index: index,
                                addressData: widget.addressData,
                                onPressed: () {
                                  setState(() {
                                    if (selectedAddressIndex == index) {
                                      selectedAddressIndex = -1;
                                    } else {
                                      selectedAddressIndex = index;
                                    }
                                  });
                                },
                                selectedAddressIndex: selectedAddressIndex,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            /// New Location & Guest Location
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                children: [
                  /// Guest Location is being used to schedule a car wash
                  /// the location will not be added to the users addressBook
                  ReusableCard(
                    childWidget: Text(
                      'Guest Location',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet<dynamic>(
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          // Modal Bottom Sheet content
                          return Wrap(
                            children: [
                              // white background to the modal bottom sheet
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                // Content on the modal sheet for the user to interact with
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // Title of the modal bottom sheet
                                    Text(
                                      'Guest Location',
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontFamily: 'Vollkorn',
                                        color: ECCCDarkBlue,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    AddressFieldForm(
                                      onChange: (streetAddressValue) {
                                        streetAddress = streetAddressValue;
                                      },
                                      addressFormKeyValue:
                                          _streetAddressFormKey,
                                      hintText: 'Street Address',
                                      icon: Icon(
                                        Icons.house,
                                        color: ECCCDarkBlue,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: AddressFieldForm(
                                            onChange: (cityValue) {
                                              city = cityValue;
                                            },
                                            hintText: 'City',
                                            icon: Icon(
                                              Icons.location_city,
                                              color: ECCCDarkBlue,
                                            ),
                                            addressFormKeyValue: _cityFormKey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: AddressFieldForm(
                                            onChange: (cityValue) {
                                              city = cityValue;
                                            },
                                            hintText: 'State',
                                            icon: Icon(
                                              Icons.location_pin,
                                              color: ECCCDarkBlue,
                                            ),
                                            addressFormKeyValue: _stateFormKey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    kSpacerBox,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: AddressFieldForm(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Zipcode left empty';
                                              } else if (value.length != 5) {
                                                return 'zipcode invalid';
                                              }
                                              return null;
                                            },
                                            keyboardType: TextInputType.number,
                                            onChange: (zipCodeValue) {
                                              zipCode = zipCodeValue;
                                              print(zipCode);
                                              if (_zipFormKey.currentState
                                                  .validate()) {
                                                setState(
                                                  () {
                                                    print('IN IFF STATEMENT');
                                                    addressEntered = true;
                                                  },
                                                );
                                              }
                                            },
                                            icon: Icon(Icons.location_pin),
                                            hintText: 'ZipCode',
                                            addressFormKeyValue: _zipFormKey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              color: Colors.transparent,
                                            )),
                                      ],
                                    ),
                                    kSpacerBox,
                                    ContinueButton(
                                      activated: addressEntered,
                                      title: 'Add Address',
                                      textColor: Colors.white,
                                      cBColor: addressEntered
                                          ? ECCCBlue
                                          : Colors.grey,
                                      onPressed: addressEntered
                                          ? () {
                                              Navigator.pop(context);

                                              setState(() {
                                                widget.addressData.addAddress(
                                                  streetAddress: streetAddress,
                                                  city: city,
                                                  state: state,
                                                  zipCode: zipCode,
                                                  newAddress: true,
                                                );
                                              });
                                              addressEntered = false;
                                            }
                                          : () {},
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
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
                    onPressed: () {
                      showModalBottomSheet<dynamic>(
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Wrap(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'New Location',
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontFamily: 'Vollkorn',
                                        color: ECCCDarkBlue,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    AddressFieldForm(
                                      onChange: (streetAddressValue) {
                                        streetAddress = streetAddressValue;
                                      },
                                      addressFormKeyValue:
                                          _streetAddressFormKey,
                                      hintText: 'Street Address',
                                      icon: Icon(
                                        Icons.house,
                                        color: ECCCDarkBlue,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: AddressFieldForm(
                                            onChange: (cityValue) {
                                              city = cityValue;
                                            },
                                            hintText: 'City',
                                            icon: Icon(
                                              Icons.location_city,
                                              color: ECCCDarkBlue,
                                            ),
                                            addressFormKeyValue: _cityFormKey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: AddressFieldForm(
                                            onChange: (cityValue) {
                                              city = cityValue;
                                            },
                                            hintText: 'State',
                                            icon: Icon(
                                              Icons.location_pin,
                                              color: ECCCDarkBlue,
                                            ),
                                            addressFormKeyValue: _stateFormKey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    kSpacerBox,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: AddressFieldForm(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Zipcode left empty';
                                              } else if (value.length != 5) {
                                                return 'zipcode invalid';
                                              }
                                              return null;
                                            },
                                            keyboardType: TextInputType.number,
                                            onChange: (zipCodeValue) {
                                              zipCode = zipCodeValue;
                                              print(zipCode);
                                              if (_zipFormKey.currentState
                                                  .validate()) {
                                                print('IN IFF STATEMENT');
                                                setState(
                                                  () {
                                                    addressEntered = true;
                                                  },
                                                );
                                              }
                                            },
                                            icon: Icon(Icons.location_pin),
                                            hintText: 'ZipCode',
                                            addressFormKeyValue: _zipFormKey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              color: Colors.transparent,
                                            )),
                                      ],
                                    ),
                                    kSpacerBox,
                                    ContinueButton(
                                      activated: addressEntered,
                                      title: 'Add Address',
                                      textColor: Colors.white,
                                      cBColor: addressEntered
                                          ? ECCCBlue
                                          : Colors.grey,
                                      onPressed: addressEntered
                                          ? () {
                                              Navigator.pop(context);
                                              setState(() {
                                                widget.addressData.addAddress(
                                                  streetAddress: streetAddress,
                                                  city: city,
                                                  state: state,
                                                  zipCode: zipCode,
                                                  newAddress: true,
                                                );
                                              });
                                              addressEntered = false;
                                            }
                                          : () {},
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    cardColor: ECCCBlueAccent,
                  ),
                ],
              ),
            ),

            ///Car Wash Package Swiper
            Flexible(
              flex: 2,
              child: Swiper(
                onTap: (int index) {
                  print('PackageNumber = $packageNumber');
                  setState(() {
                    if (packageNumber == index) {
                      packageSelected = false;
                      packageNumber = -1;
                    }
                    packageSelected = true;
                    packageNumber = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                  packageDetails: packageDetailsList[index],
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

            /// Continue button that schedules the car wash and returns the
            /// the scheduledWashInfo list to the home widget so that it can
            /// be used to generate the upcoming washes list.
            ContinueButton(
                title: 'Schedule Wash',
                textColor: Colors.white,
                activated: packageSelected,
                cBColor: packageSelected == true ? ECCCBlue : Colors.grey,
                onPressed: packageSelected == true
                    ? () {
                        print('car wash scheduled');
                        Car car = Car('Bug', 'lit', 'tity');
                        CarWash carWash =
                            CarWash(car, 'date', 'time', _address, 'Diamond');
                        Navigator.pop(context, [
                          selectedCarCardIndex,
                          _month,
                          _date,
                          _address,
                          _timeSelectedForWash,
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

        /// Should show the user an animation for booking a car wash is currently
        /// undergoing construction

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

  int getFocusDayAvailableTime() {
    if (isSameDay(_selectedDay, DateTime.now())) {
      return getTodayAvailableTime();
    } else {
      return 9;
    }
  }

  int getTodayAvailableTime() {
    dateSelected = true;
    int currentHour = DateTime.now().hour;

    print('todayTime:$currentHour');

    /// All slots available for today.
    if (currentHour < 9) {
      return 9;
    }

    /// Limited amount of slots available for today.
    else if (currentHour < 15) {
      return 17 - currentHour;
    }

    /// no Slots available for today time is past 3:00pm
    print('times Available for today: $timeSlotsAvailability');
    return 0;
  }
}

Widget getTextWidget(bool isToday, int index) {
  String displayText = 'time';

  if (isToday == true) {
    return Text(
      '${DateTime.now().hour % 12 + index}:00',
      textAlign: TextAlign.center,
    );
  }
  displayText = ((index + 9) % 12).toString();

  return Text('$displayText :00');
}
