import 'package:flutter/material.dart';
import 'package:express_car_cleaning_co/constants.dart';
import 'package:express_car_cleaning_co/models/TextFieldModels/ProfileTextFields.dart';

/// CLASSNAME: CIRCLEAVATARANDTEXTFIELDS
///
/// PARAMETERS: onTap: allows for users to edit their avatar
///             email: user email
///
///
///
/// DESCRIPTION: Used in the profile screen to display user avatar and email.

class CircleAvatarAndEmail extends StatelessWidget {
  const CircleAvatarAndEmail({
    @required this.onTap,
    this.email,
  });

  final Function onTap;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: GestureDetector(
              onTap: onTap,
              child: CircleAvatar(
                backgroundColor: ECCCBlue,
                radius: 50,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ),
          kSpacerBox,
          Expanded(
            child: ProfileTextFields(
              text: email,
            ),
          ),
        ],
      ),
    );
  }
}
