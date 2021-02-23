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

class AddressesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: ECCCBlue.withOpacity(.2),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(0, 4))
              ],
              color: ECCCBlue),
          child: EditHomeAddress(),
          alignment: Alignment.center,
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: ECCCBlue.withOpacity(.2),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset(0, 4))
            ],
            shape: BoxShape.circle,
            color: ECCCBlue,
          ),
          child: AddNewAddress(),
        ),
      ],
    );
  }
}

class EditHomeAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                color: Color(0xFF6D777A),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.black,
                            size: 36,
                          ),
                          Text(
                            'Edit home address',
                            style: TextStyle(fontSize: 36, color: Colors.black),
                          )
                        ],
                      ),
                      TextField(
                        onChanged: (value) {
                          //print(value);
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ECCCBlue, width: 2)),
                          disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ECCCBlue)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ECCCBlue)),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ECCCBlue, width: 2)),
                          disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ECCCBlue)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ECCCBlue)),
                        ),
                      ),
                      ContinueButton(
                        title: 'Update Address',
                        textColor: Colors.white,
                        cBColor: ECCCDarkBlue,
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.home,
          color: Colors.white,
          size: 36,
        ));
  }
}

class AddNewAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                color: Color(0xFF6D777A),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.add_location,
                            color: Colors.black,
                            size: 36,
                          ),
                          Text(
                            'Add Address',
                            style: TextStyle(fontSize: 36, color: Colors.black),
                          )
                        ],
                      ),
                      TextField(
                        onChanged: (value) {
                          //print(value);
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ECCCBlue, width: 2)),
                          disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ECCCBlue)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ECCCBlue)),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ECCCBlue, width: 2)),
                          disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ECCCBlue)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ECCCBlue)),
                        ),
                      ),
                      ContinueButton(
                        title: 'Add Address',
                        textColor: Colors.white,
                        cBColor: ECCCDarkBlue,
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add_location,
          color: Colors.white,
          size: 36,
        ));
  }
}
