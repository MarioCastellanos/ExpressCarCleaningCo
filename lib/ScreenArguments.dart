import 'models/DataModels/Car_Data.dart';
import 'models/DataModels/CarWashData.dart';
import 'models/DataModels/Address_Data.dart';

class ScreenArguments {
  final CarData carData;
  final AddressData addressData;
  final CarWashData carWashData;
  ScreenArguments(this.carData, this.addressData, this.carWashData);
}
