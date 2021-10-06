import 'models/DataModels/Car_Data.dart';g
import 'models/DataModels/CarWashData.dart';
import 'models/DataModels/Address_Data.dart';

/// AUTHOR : MARIO H.C.H
/// DATE: 10.5.21
/// CLASSNAME: SCREENARGUMENTS
/// PARAMETERS: CarData carData:
///             AddressData addressData:
///             CarWashData carWashData:
/// DESCRIPTION: This class is designed to push data between screens

class ScreenArguments {
  final CarData carData;
  final AddressData addressData;
  final CarWashData carWashData;
  ScreenArguments(this.carData, this.addressData, this.carWashData);
}
