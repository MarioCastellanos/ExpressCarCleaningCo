import 'package:flutter/material.dart';
import 'package:cta_auto_detail/constants.dart';

/// CLASSNAME: EmailTextField
///
/// PARAMETERS: errorText: error text.
///             onChanged:
///
/// DESCRIPTION: text field desined for the user to input their emails.
///

class EmailTextField extends StatelessWidget {
  final String errorText;

  final Function onChanged;

  EmailTextField({@required this.onChanged, @required this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      decoration: kEmailTextFieldDecoration.copyWith(errorText: errorText),
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 18,
        color: ECCCBlueAccent,
      ),
    );
  }
}

const kEmailTextFieldDecoration = InputDecoration(
  fillColor: ECCCBlue,
  hintText: 'Email',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  prefixIcon: Icon(
    Icons.email,
    color: ECCCBlueAccent,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: ECCCBlueAccent),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: ECCCBlueAccent),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: (BorderRadius.all(Radius.circular(10))),
    borderSide: BorderSide(color: ECCCBlueAccent, width: 2),
  ),
);
