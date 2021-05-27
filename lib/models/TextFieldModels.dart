import 'package:cta_auto_detail/models/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
      decoration: kPasswordTextFieldDecoration.copyWith(
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

class CarWashDeliveredText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColorizeAnimatedTextKit(
      text: ['Car Wash Delivered'],
      isRepeatingAnimation: false,
      speed: Duration(milliseconds: 250),
      colors: [
        ECCCBlue,
        Colors.white,
        ECCCBlue,
      ],
      textStyle: TextStyle(
        fontSize: 36,
        fontFamily: 'Vollkorn',
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.start,
    );
  }
}

class CircleAvatarAndTextFields extends StatelessWidget {
  const CircleAvatarAndTextFields(
      {@required this.onTap, this.email, this.userName});

  final Function onTap;
  final String email;
  final String userName;

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
          SizedBox(
            width: 10,
          ),
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

class ProfileTextFields extends StatelessWidget {
  const ProfileTextFields({@required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: ECCCDarkBlue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class CityTF extends StatelessWidget {
  final Function onCHANGE;
  CityTF({this.onCHANGE});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextField(
        onChanged: onCHANGE,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ECCCDarkBlue, width: 2),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ECCCDarkBlue, width: 2),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: ECCCDarkBlue, width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ECCCBlueAccent, width: 2),
          ),
          hintText: 'City',
          hintStyle: TextStyle(color: Colors.grey),
          icon: Icon(
            Icons.location_city,
            color: ECCCDarkBlue,
          ),
        ),
      ),
    );
  }
}

class ZipCodeTF extends StatelessWidget {
  final Function onCHANGE;

  ZipCodeTF({this.onCHANGE});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextField(
        onChanged: onCHANGE,
        keyboardType: TextInputType.number,
        maxLength: 5,
        decoration: InputDecoration(
          counterText: '',
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
          hintText: 'Zip Code',
          hintStyle: TextStyle(color: Colors.grey),
          icon: Icon(
            Icons.pin_drop,
            color: ECCCDarkBlue,
          ),
        ),
      ),
    );
  }
}

class StateTF extends StatelessWidget {
  final Function onCHANGE;

  StateTF({this.onCHANGE});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextField(
        onChanged: onCHANGE,
        maxLength: 2,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ECCCDarkBlue, width: 2),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ECCCDarkBlue, width: 2),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: ECCCDarkBlue, width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ECCCBlueAccent, width: 2),
          ),
          hintText: 'State',
          hintStyle: TextStyle(color: Colors.grey),
          icon: Icon(
            Icons.location_pin,
            color: ECCCDarkBlue,
          ),
        ),
      ),
    );
  }
}

class StreetAddressForm extends StatelessWidget {
  final addressFormKeyValue;
  final Function onChange;

  StreetAddressForm({this.addressFormKeyValue, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: addressFormKeyValue,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'address left empty';
              }
              return null;
            },
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
              hintText: 'Street Address',
              hintStyle: TextStyle(color: Colors.grey),
              icon: Icon(
                Icons.house,
                color: ECCCDarkBlue,
              ),
            ),
            onChanged: onChange,
          )
        ],
      ),
    );
  }
}
