import 'package:flutter/material.dart';

import '../../constants.dart';

/// CLASSNAME:
/// PARAMETERS:
/// DESCRIPTION:

class PassWordTextField extends StatelessWidget {
  final String errorText;

  final bool obscureText;

  final Function setVisibility;
  final Function onChanged;

  final IconData visibilityIconData;

  PassWordTextField(
      {@required this.errorText,
      @required this.obscureText,
      @required this.visibilityIconData,
      @required this.onChanged,
      @required this.setVisibility});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      decoration: passwordTextFieldDecoration.copyWith(
          hintText: 'Password',
          errorText: errorText,
          suffixIcon: IconButton(
            icon: Icon(
              visibilityIconData,
              color: ECCCBlue,
            ),
            onPressed: setVisibility,
          )),
      textAlign: TextAlign.start,
      style: TextStyle(fontSize: 18, color: ECCCBlueAccent),
    );
  }
}

const passwordTextFieldDecoration = InputDecoration(
  fillColor: ECCCBlueAccent,
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  prefixIcon: Icon(
    Icons.lock,
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
    borderRadius: (BorderRadius.all(
      Radius.circular(10),
    )),
    borderSide: BorderSide(color: ECCCBlueAccent, width: 2),
  ),
);
