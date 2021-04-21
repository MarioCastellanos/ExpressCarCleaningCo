import 'package:cta_auto_detail/models/Address.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressData extends ChangeNotifier {
  List<Address> _addressList = [];
  List<String> tempAddressList = [];

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool> initialized;
  Future<List<String>> _futureAddressList;

  /// Initializing the address list

  void initializeAddressList() async {
    final SharedPreferences prefs = await _prefs;

    /// checking if initialization has been performed before
    if (prefs.getBool('initAddress') == null) {
      print('!!!!!!!!!!!!!CARSLIST INITIALIZED FOR FIRST TIME!!!!!!!!!!!!');
      prefs.setBool('initAddress', true);
      _futureAddressList = _prefs.then(
        (SharedPreferences prefs) {
          return (prefs.getStringList('addressList') == null
              ? [
                  '10955 N Tantau Ave',
                  'Cupertino',
                  'CA',
                  '95014',
                ]
              : prefs.getStringList('addressList'));
        },
      );
      prefs.setStringList('addressList', await _futureAddressList);
    } else {
      tempAddressList = prefs.getStringList('addressList');
      print('Initialization was completed before $tempAddressList');
      for (int i = 0; i < tempAddressList.length; i++) {
        print(' $i mod 3 = : ${i % 3}');
        if (i % 4 == 0) {
          addAddress(
            streetAddress: tempAddressList[i],
            city: tempAddressList[i + 1],
            state: tempAddressList[i + 2],
            zipCode: tempAddressList[i + 3],
            newAddress: false,
          );
        }
      }
      print('Address list was intialized from temp list $tempAddressList');
    }
  }

  void addAddress(
      {String streetAddress,
      String city,
      String state,
      String zipCode,
      bool newAddress}) {
    _addressList.add(Address(streetAddress, city, state, zipCode));
    notifyListeners();
    if (newAddress == true) {
      _addAddressToSharedPreferences(
        streetAddress,
        city,
        state,
        zipCode,
      );
    }
    print('Address List has been updated ');
  }

  Future<void> _addAddressToSharedPreferences(
      String streetAddress, String city, String state, String zipCode) async {
    final SharedPreferences prefs = await _prefs;
    final List<String> addressListTemp = (prefs.getStringList('carsList'));

    addressListTemp.add(streetAddress);
    addressListTemp.add(city);
    addressListTemp.add(state);
    addressListTemp.add(zipCode);
    print('addressList in addCarTo SharedPreferences $addressListTemp');
    prefs.setStringList('addressList', addressListTemp);
  }
}
