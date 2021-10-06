import 'package:express_car_cleaning_co/models/Objects/Address.dart';
import 'package:express_car_cleaning_co/models/Objects/Car.dart';

/// AUTHOR: MARIO H. C. H.
/// DATE: SEPTEMBER 16 2021
/// CLASSNAME: CarWash
///
/// PARAMETERS: Car _car: the car object selected to be washed.
///             String _date: the date the car wash is scheduled.
///             String _time: the time the car wash is scheduled at.
///             String _address: the address the car wash is scheduled at.
///
/// DESCRIPTION: CarWash is designed to represent a car wash that has been scheduled by the user
///              it is a collection of all the necessary information for the car wash.

class CarWash {
  final Car _car;
  final String _date;
  final String _time;
  final Address _address;
  final String _package;

  CarWash(
    this._car,
    this._date,
    this._time,
    this._address,
    this._package,
  );

  Car get car => _car;

  String get date => _date;

  String get time => _time;

  Address get address => _address;

  String get package => _package;
}
