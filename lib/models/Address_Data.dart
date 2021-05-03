import 'dart:collection';
import 'package:cta_auto_detail/models/Address.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressData extends ChangeNotifier {
  List<Address> _addressList = [];
  List<String> tempAddressList = [];

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<List<String>> _futureAddressList;

  /// Initializing the address list from stored shared preferences or for the first time with default values

  void initializeAddressList() async {
    final SharedPreferences prefs = await _prefs;

    /// checking if initialization has been performed before
    if (prefs.getBool('initAddress') == null) {
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
      tempAddressList = await _futureAddressList;
      prefs.setStringList('addressList', tempAddressList);
      for (int i = 0; i < tempAddressList.length; i++) {
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
    } else {
      tempAddressList = prefs.getStringList('addressList');
      for (int i = 0; i < tempAddressList.length; i++) {
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
    }
  }

  void addAddress(
      {String streetAddress,
      String city,
      String state,
      String zipCode,
      bool newAddress}) {
    _addressList.add(
      Address(
        streetAddress,
        city,
        state,
        zipCode,
      ),
    );
    notifyListeners();
    if (newAddress == true) {
      _addAddressToSharedPreferences(
        streetAddress,
        city,
        state,
        zipCode,
      );
    }
  }

  Future<void> _addAddressToSharedPreferences(
    String streetAddress,
    String city,
    String state,
    String zipCode,
  ) async {
    final SharedPreferences prefs = await _prefs;
    final List<String> addressListTemp = (prefs.getStringList('addressList'));

    addressListTemp.add(streetAddress);
    addressListTemp.add(city);
    addressListTemp.add(state);
    addressListTemp.add(zipCode);
    prefs.setStringList('addressList', addressListTemp);
  }

  UnmodifiableListView<Address> get addressList {
    return UnmodifiableListView(_addressList);
  }

  int get addressCount {
    return _addressList.length;
  }

  // removes a address at selected index;
  void removeAddress(int index) {
    _addressList.removeAt(index);
    notifyListeners();
  }
}
