import 'package:flutter/foundation.dart';

/// Car Object designed to hold key elements required for proper car cleaning : make, model, and interior.
/// Includes getter but no setters.
/// Constructor takes three String parameters make, interior, and model.

/// CLASSNAME:
/// PARAMETERS:
/// DESCRIPTION:

class Car {
  // Make of the car Subaru Mercedez,
  final String _make;
  // Model of car // Wrx, Boxster / SLk, C63
  final String _model;
  // Leather / Faux Leather / Vinyl / Wood / Fabric
  final String _interior;

  Car(this._make, this._interior, this._model);

  String get interior => _interior;

  String get model => _model;

  String get make => _make;
}
