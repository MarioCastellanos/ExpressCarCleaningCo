/// Foundations & collection imports used to keep file size relatively small
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:cta_auto_detail/models/Car.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// CarData class is designed to facilitate updating the car list and providing users with
/// a UnmodifiableListView encapsulating the CarData data. The usage of a Change Notifier
/// facilitates the updating of widgets dependent of the CarData for content as the  change notifier
/// immediate rebuilds these widgets.

/// TODO : Make CarData run on SharedPreferences stored List<String>
/// TODO :

class CarData extends ChangeNotifier {
  List<Car> _carList = [];

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<List<String>> _futuresCarsList;
  List<String> tempCarsList = [];

  Future<void> _addCarToSharedPreferences(
      String make, String model, String interior) async {
    final SharedPreferences prefs = await _prefs;
    final List<String> carsList2 = (prefs.getStringList('carsList'));
    _futuresCarsList =
        prefs.setStringList("carsList", carsList2).then((bool success) {
      return carsList2;
    });
    print('carsList $carsList2');
  }

  void convertFutureToStr() async {
    tempCarsList = await _futuresCarsList;
    print('tempCarsList convert from future $tempCarsList');
  }

  // Initializes car list from shared preferences,
  void initializeCarList() async {
    _futuresCarsList = _prefs.then((SharedPreferences prefs) {
      return (prefs.getStringList('carsList') == null
          ? ['Buggati', 'Chiron', 'Alcantara']
          : prefs.getStringList('carsList'));
    });
    tempCarsList = await _futuresCarsList;
    print('carsList from initialize $tempCarsList');
    String make;
    String model;
    for (int i = 0; i < tempCarsList.length; i++) {
      print(' $i mod 3 = : ${i % 3}');
      if (i % 3 == 0) {
        print('make: ${tempCarsList[0]}');
        print('model: ${tempCarsList[1]}');
        print('interior: ${tempCarsList[2]}');
        addCar(
          make: tempCarsList[0],
          model: tempCarsList[1],
          interior: tempCarsList[2],
        );
      }
    }
  }

  void addCar({String make, String model, String interior}) {
    _carList.add(Car(make, model, interior));
    print('CAR list has Been update');
    notifyListeners();
  }

  UnmodifiableListView<Car> get carsList {
    return UnmodifiableListView(_carList);
  }

  int get carsCount {
    return _carList.length;
  }

  // removes a car at selected index;
  void removeCar(int index) {
    _carList.removeAt(index);
    notifyListeners();
  }
}
