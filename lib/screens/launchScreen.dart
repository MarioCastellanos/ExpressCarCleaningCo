import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/RoundedButton.dart';
import 'package:cta_auto_detail/models/TextFieldModels.dart';
import 'package:cta_auto_detail/screens/signUp.dart';
import 'package:cta_auto_detail/screens/singIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// LAUNCH SCREEN
// First screen the user interacts with.

class LaunchScreen extends StatefulWidget {
  static const String id = 'LaunchScreen';
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(


            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RedCarLogo(),
              TextLogo(),
              CarWashDeliveredText(),
              // Sign In Button
              // onPressed: Navigates the user to Sign In screen

              RoundedButton(
                rbColor: ExpressCarWashRedAccent,
                title: 'Sign In',
                onPressed: () {
                  Navigator.pushNamed(context, SignIn.id);
                },
              ),

              // Used as a spacer between the buttons
              kSpacerBox,

              // Sign Up Button
              // onPressed:  Navigates the user to the Sign in screen
              // Outline color is ExpressCarWasRedAccent

              OutlineButton(

                onPressed: () {
                  Navigator.pushNamed(context, SignUp.id);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(12),
                child: Text(
                  'Sign Up',
                  style: kOutLineButtonTextStyle,
                ),
                borderSide: BorderSide(
                  color: ExpressCarWashRedAccent,
                  width: 2,
                ),
                disabledBorderColor: ExpressCarWashRedAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
