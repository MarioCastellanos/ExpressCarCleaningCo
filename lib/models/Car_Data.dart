/// Foundations & collection imports used to keep file size relatively small
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:cta_auto_detail/models/Car.dart';


/// CarData class is designed to facilitate updating the car list and providing users with
/// a UnmodifiableListView encapsulating the CarData data. The usage of a Change Notifier
/// facilitates the updating of widgets dependent of the CarData for content as the  change notifier
/// immediate rebuilds these widgets.


class CarData extends ChangeNotifier{

  List<Car> _carList = [];

  void addCar({String make, String model, String interior}){
    _carList.add(Car(make, model, interior));
    notifyListeners();
  }

  UnmodifiableListView<Car> get carsList {
    return UnmodifiableListView(_carList);
  }

  int get carsCount {
    return _carList.length;
  }

  // removes a car at selected index;
  void removeCar (int index) {
    _carList.removeAt(index);
    notifyListeners();
  }

}