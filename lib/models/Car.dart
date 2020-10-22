/// Car Object designed to hold key elements required for proper car cleaning : make, model, and interior.
/// Includes getter but no setters.
/// Constructor takes three String parameters make, interior, and model.

class Car {
  // Make of the car Subaru Mercedez,
  final String _make;
  // Model of car
  final String _model;
  // Leather / Faux Leather / Vinyl / Wood / Fabric
  final String _interior;

  Car(this._make, this._interior, this._model);

  String get interior => _interior;

  String get classification => _model;

  String get make => _make;
}