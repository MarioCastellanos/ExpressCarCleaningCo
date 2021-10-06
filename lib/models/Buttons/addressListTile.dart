import 'package:express_car_cleaning_co/models/DataModels/Address_Data.dart';
import 'package:flutter/material.dart';
import 'package:express_car_cleaning_co/constants.dart';

/// AUTHOR: MARIO H. C. H.
/// DATE: SEPTEMBER 1ST 2021
/// CLASSNAME AddressListTile
///
/// PARAMETERS: int Index:
///             AddressData addressData:
///
/// DESCRIPTION: List tile is used to display user address info
///              in a simple readable format.

class AddressListTile extends StatelessWidget {
  // the index of the addressList tile in the list
  final int index;
  // the index of the selected AddressTile
  final int selectedAddressIndex;
  // function to perform when the tile is tapped
  final Function onPressed;
  // address data used to access users address list
  final AddressData addressData;

  AddressListTile({
    this.index,
    this.addressData,
    this.onPressed,
    this.selectedAddressIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Icon(
                  Icons.home,
                  color: ECCCBlueAccent,
                  size: 30,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${addressData.addressList[index].streetAddress}\n'
                  '${addressData.addressList[index].city}\t ${addressData.addressList[index].state}\n'
                  '${addressData.addressList[index].zipCode}',
                  style: TextStyle(
                    color: ECCCBlueAccent,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(),
                child: Icon(
                  Icons.check,
                  color: selectedAddressIndex == index
                      ? ECCCBlueAccent
                      : Colors.black,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
