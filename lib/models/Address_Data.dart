import 'package:cta_auto_detail/models/Address.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressData extends ChangeNotifier {
  List<Address> _addressList = [];
  List<Address> tempAddressList = [];

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool> initialized;
  Future<List<String>> _futureAddressList;
}
