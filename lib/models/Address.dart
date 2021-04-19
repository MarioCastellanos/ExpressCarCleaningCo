class Address {
  final String _streetAddress;

  final String _city;

  final String _state;

  final String _zipCode;

  Address(this._streetAddress, this._state, this._city, this._zipCode);

  String get state => _state;

  String get city => _city;

  String get streetAddress => _streetAddress;

  String get zipCode => _zipCode;
}
