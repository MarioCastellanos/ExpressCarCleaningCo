/// Foundations & collection imports used to keep file size relatively small
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:express_car_cleaning_co/models/Objects/Car.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// CarData class is designed to facilitate updating the car list and providing users with
/// a UnmodifiableListView encapsulating the CarData data. The usage of a Change Notifier
/// facilitates the updating of widgets dependent of the CarData for content as the  change notifier
/// immediate rebuilds these widgets to reflect any changes.

/// CLASSNAME:
/// PARAMETERS:
/// DESCRIPTION:

class CarData extends ChangeNotifier {
  List<Car> _carList = [];
  List<String> tempCarsList = [];

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<List<String>> _futuresCarsList;

  /// Initializes car list from shared preferences, or for the first time with default values
  void initializeCarList() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getBool('init') == null) {
      prefs.setBool('init', true);
      _futuresCarsList = _prefs.then((SharedPreferences prefs) {
        return (prefs.getStringList('carsList') == null
            ? [
                'Chiron',
                'Buggati',
                'Alcantara',
              ]
            : prefs.getStringList('carsList'));
      });
      tempCarsList = await _futuresCarsList;
      prefs.setStringList('carsList', tempCarsList);
      for (int i = 0; i < tempCarsList.length; i++) {
        if (i % 3 == 0) {
          addCar(
            make: tempCarsList[i],
            model: tempCarsList[i + 1],
            interior: tempCarsList[i + 2],
            newCar: false,
          );
        }
      }
    } else {
      tempCarsList = prefs.getStringList('carsList');
      for (int i = 0; i < tempCarsList.length; i++) {
        if (i % 3 == 0) {
          addCar(
            make: tempCarsList[i],
            model: tempCarsList[i + 1],
            interior: tempCarsList[i + 2],
            newCar: false,
          );
        }
      }
    }
  }

  void addCar({
    String make,
    String model,
    String interior,
    bool newCar,
  }) {
    _carList.add(
      Car(
        make,
        model,
        interior,
      ),
    );
    notifyListeners();
    if (newCar == true) {
      _addCarToSharedPreferences(
        make,
        model,
        interior,
      );
    }
  }

  Future<void> _addCarToSharedPreferences(
    String make,
    String model,
    String interior,
  ) async {
    final SharedPreferences prefs = await _prefs;
    final List<String> carsList2 = (prefs.getStringList('carsList'));

    carsList2.add(make);
    carsList2.add(model);
    carsList2.add(interior);
    prefs.setStringList('carsList', carsList2);
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
