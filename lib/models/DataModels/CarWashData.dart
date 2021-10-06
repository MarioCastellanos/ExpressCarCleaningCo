import 'dart:collection';
import 'package:express_car_cleaning_co/models/Objects/Address.dart';
import 'package:express_car_cleaning_co/models/Objects/CarWash.dart';
import 'package:flutter/foundation.dart';
import 'package:express_car_cleaning_co/models/Objects/Car.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// CarData class is designed to facilitate updating the car list and providing users with
/// a UnmodifiableListView encapsulating the CarData data. The usage of a Change Notifier
/// facilitates the updating of widgets dependent of the CarData for content as the  change notifier
/// immediate rebuilds these widgets to reflect any changes.

/// AUTHOR: MARIO H. C. H.
/// DATE: 09/16/21
/// CLASSNAME: CAR WASH DATA
///
/// PARAMETERS: NONE
///
/// DESCRIPTION: Designed to encapsulate all the car wash data. Making it easier to display
///              across different screens.
///

///                 Create a switch to determine how much info i should be storing
///                 if the car is in the users fleet (0) ill save only its index in CarData
///                 otherwise (1) ill store its information in the CarWashData List
///
///                 In Fleet storage:
///                 Switch : '0',
///                 CarData Index: 'index',
///                 AddressData Index: index,
///                 Date: '10/30/21',
///                 Time: '09:00',
///                 Package: 'Diamond'
///
///                 Guest Car storage :
///                 Switch: '1',
///                 Make: car make,
///                 Model: model,
///                 Trim: trim,
///                 Year: year,
///                 AddressData Index: index,
///                 Date: '10/30/21',
///                 Time: '09:00',
///                 Package: 'Diamond'
///
///

class CarWashData extends ChangeNotifier {
  //List of upcoming car wash info
  List<CarWash> _carWashList = [];
  // temporary List representation of upcoming car wash info
  List<String> tempCarWashList = [];

  // int used to determine the amount of individual car washes scheduled.
  // used by the generator to generate carWashListTiles.
  int _carWashCount = 0;

  // bool used to determine if there are any car washes scheduled
  bool isEmpty = true;

  // Instance of shared preferences
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // Future list of string used to get the list of car washes from shared preferences.
  Future<List<String>> _futuresCarWashList;

  /// Initializes carWash list from shared preferences, or for the first time with default values
  void initializeCarWashList() async {
    final SharedPreferences prefs = await _prefs;
    // checking to see if the list has been initialized before by checking a
    // boolean value stored in shared preferences.
    if (prefs.getBool('init') == null) {
      prefs.setBool('init', true);
      isEmpty = true;
      _carWashCount = 0;
      // //Setting the amount of carWashes to 1
      // prefs.setInt('CarWashCount', _carWashCount);
      // _futuresCarWashList = _prefs.then((SharedPreferences prefs) {
      //   // Sets the empty list to default values that follow protocol for
      //   // a car within the users fleet.
      //   return (prefs.get('carWashList') == null
      //       ? [
      //           '0',
      //           '0',
      //           '726 Cupertino Ave, Cupertino, Ca, 91764',
      //           '10/30/21',
      //           '09:00',
      //           'Diamond',
      //         ]
      //       : prefs.getStringList('carWashList'));
      // });
      // tempCarWashList =
      //     await _futuresCarWashList; // Converting the list form Future<List<String>> to List<String>
      // prefs.setStringList('carWashList',
      //     tempCarWashList); // Saving the default value list to shared preferences.
      // // iterating through the list to generate the List<CarWash>
      // // here newCarWash is set to false because we already added it to the shared preferences.
      // buildCarWashList();
    }
    // The list List<CarWash> will be populated with values from the shared preferences list.
    else {
      isEmpty = false;
      _carWashCount = prefs.getInt('CarWashCount');
      print('CarsCountFromInitialize: $_carWashCount');
      tempCarWashList = prefs.getStringList('carWashList');
      buildCarWashList();
    }
  }

  void buildCarWashList() {
    for (int i = 0; i < _carWashCount; i++) {
      // adding guest car to list with guest location
      if (i % 5 == 0) {
        addCarWash(
          car: Car(
            tempCarWashList[i],
            tempCarWashList[i],
            tempCarWashList[i],
          ),
          date: tempCarWashList[i],
          time: tempCarWashList[i],
          address: Address(
            tempCarWashList[i],
            tempCarWashList[i],
            tempCarWashList[i],
            tempCarWashList[i],
          ),
          package: tempCarWashList[i],
          newCarWash: false,
        );
      }
    }
  }

  /// TODO: CHECK IF VALUES ARE FROM FLEET OR GUEST CARS LAYOUT.
  /// TODO: Add index for the start of new car wash to carWashIndexList;

  // Adds a car wash to the car wash list
  // parameters: Car car: the car object representing the car to wash.
  //             Address address:
  //             String date:
  //             String time:
  //             String package:
  //             bool newCarWash:
  void addCarWash({
    Car car,
    Address address,
    String date,
    String time,
    String package,
    bool newCarWash,
  }) {
    _carWashList.add(CarWash(car, date, time, address, package));
    notifyListeners();
    if (newCarWash == true) {
      _addCarWashToSharedPreferences();
    }
  }

  Future<void> _addCarWashToSharedPreferences() async {
    final SharedPreferences prefs = await _prefs;
    final List<String> carsList2 = (prefs.getStringList('carWashList'));

    prefs.setStringList('carWashList', carsList2);
  }

  UnmodifiableListView<CarWash> get carWashList {
    return UnmodifiableListView(_carWashList);
  }

  /// TODO : Need to keep track of cars in List
  int get carWashCount {
    print('carWashCount = $_carWashCount');
    return _carWashCount;
  }

  /// TODO: NEED TO MODIFY INDEX VALUE PASSED BASED ON LIST CONTENTS.
  /// TODO:
  void removeCar(int index) {
    _carWashList.removeAt(index);
    _carWashCount--;
    notifyListeners();
  }
}
