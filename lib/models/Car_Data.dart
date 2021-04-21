/// Foundations & collection imports used to keep file size relatively small
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:cta_auto_detail/models/Car.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// CarData class is designed to facilitate updating the car list and providing users with
/// a UnmodifiableListView encapsulating the CarData data. The usage of a Change Notifier
/// facilitates the updating of widgets dependent of the CarData for content as the  change notifier
/// immediate rebuilds these widgets.

class CarData extends ChangeNotifier {
  List<Car> _carList = [];
  List<String> tempCarsList = [];

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool> initialized;
  Future<List<String>> _futuresCarsList;

  Future<void> _addCarToSharedPreferences(
      String make, String model, String interior) async {
    final SharedPreferences prefs = await _prefs;
    final List<String> carsList2 = (prefs.getStringList('carsList'));

    carsList2.add(make);
    carsList2.add(model);
    carsList2.add(interior);
    print('carsList in addCarTo SharedPreferences $carsList2');
    prefs.setStringList('carsList', carsList2);
  }

  // Initializes car list from shared preferences,
  void initializeCarList() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getBool('init') == null) {
      prefs.setBool('init', true);
      _futuresCarsList = _prefs.then((SharedPreferences prefs) {
        return (prefs.getStringList('carsList') == null
            ? ['Buggati', 'Chiron', 'Alcantara']
            : prefs.getStringList('carsList'));
      });
      tempCarsList = await _futuresCarsList;
      prefs.setStringList('carsList', tempCarsList);
      for (int i = 0; i < tempCarsList.length; i++) {
        print(' $i mod 3 = : ${i % 3}');
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
      print('Initialization was completed before');
      for (int i = 0; i < tempCarsList.length; i++) {
        print(' $i mod 3 = : ${i % 3}');
        if (i % 3 == 0) {
          print('make: ${tempCarsList[i]}');
          print('model: ${tempCarsList[i + 1]}');
          print('interior: ${tempCarsList[i + 2]}');
          addCar(
            make: tempCarsList[i],
            model: tempCarsList[i + 1],
            interior: tempCarsList[i + 2],
            newCar: false,
          );
        }
      }
    }
    print('carsList from initialize $tempCarsList');
  }

  void addCar({String make, String model, String interior, bool newCar}) {
    _carList.add(Car(make, model, interior));
    notifyListeners();
    if (newCar == true) {
      _addCarToSharedPreferences(make, model, interior);
    }
    print('CAR list has Been update');
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
