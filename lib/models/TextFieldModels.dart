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
      {
        @required this.errorText,
        @required this.obscureText,
        @required this.visibilityIconData,
        @required this.onChanged,
        @required this.setVisibility
      }
      );

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
  const CircleAvatarAndTextFields({@required this.onTap});

  final Function onTap;

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
                  Icons.image,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ProfileTextFields(
                  inputDecoration:
                      kUserNameEmailDecoration.copyWith(hintText: 'UserName'),
                ),
                ProfileTextFields(
                  inputDecoration:
                      kUserNameEmailDecoration.copyWith(hintText: 'Email'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTextFields extends StatelessWidget {
  const ProfileTextFields({@required this.inputDecoration});

  final InputDecoration inputDecoration;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: ECCCBlueAccent,
      ),
      decoration: inputDecoration,
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
          decoration: BoxDecoration(shape: BoxShape.circle, color: ECCCBlue),
          child: GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: Color(0xFF6D777A),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.home,
                                  color: Colors.black,
                                  size: 36,
                                ),
                                Text(
                                  'Edit home address',
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.black),
                                )
                              ],
                            ),
                            TextField(
                              onChanged: (value) {
                                print(value);
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
              )),
          alignment: Alignment.center,
        ),
        Container(
          height: 60,
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
          child: GestureDetector(
            onTap: () {
              print('add location ');
            },
            child: Icon(
              Icons.add_location,
              color: Colors.white,
              size: 26,
            ),
          ),
        )
      ],
    );
  }
}
