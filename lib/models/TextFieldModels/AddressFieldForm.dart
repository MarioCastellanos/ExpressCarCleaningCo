import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants.dart';

/// CLASS NAME: ADDRESSFIELDFORM
///
/// PARAMETERS: AddressFormKey:    Is a global key to access the field form.
///             Function onChange: Sets the corresponding variable to the string being inputed.
///             Function validator: Used to validate the incoming string from onChange
///             Icon icon:  Leading icon.
///             String hintText: hint text provided to help user determine what info
///                              needs to be typed into the text field.
///             KeyboardType: Depending on what information we need we make the entry
///                           of the data simplified for the user by providing specific keyboards
///                           for example when we take zipcodes we provide the user with numeric
///                           keyboard as only numbers are allowed.
///             int maxLength: The max lenght of string allowed.
///
/// DESCRIPTION: AddressField Form is a modular class textFormField designed to be used in the modal bottom
///              sheet when adding a new address to the users address book. It is used to intake users
///              street address, zip code, city and state.

class AddressFieldForm extends StatelessWidget {
  final addressFormKeyValue;
  final Function onChange;
  final Function validator;

  final Icon icon;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLength;

  AddressFieldForm({
    this.addressFormKeyValue,
    this.onChange,
    this.validator,
    this.icon,
    this.hintText,
    this.keyboardType,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: addressFormKeyValue,
      child: TextFormField(
        maxLength: maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ECCCDarkBlue,
              width: 2,
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ECCCDarkBlue,
              width: 2,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ECCCDarkBlue,
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ECCCBlueAccent,
              width: 2,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          icon: icon,
        ),
        onChanged: onChange,
      ),
    );
  }
}
