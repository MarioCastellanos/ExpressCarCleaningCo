import 'package:express_car_cleaning_co/constants.dart';
import 'package:express_car_cleaning_co/models/Buttons/RoundedButton.dart';
import 'package:express_car_cleaning_co/screens/signUp.dart';
import 'package:express_car_cleaning_co/screens/singIn.dart';
import 'package:express_car_cleaning_co/models/widgets/ECCCBlueCarLogo.dart';
import 'package:express_car_cleaning_co/LaunchScreenText/LogoText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

/// LAUNCH SCREEN
/// First screen the user interacts with.
/// Gives the user the option between signing in and registering for the app
///

/// CLASSNAME:
/// PARAMETERS:
/// DESCRIPTION:

class LaunchScreen extends StatefulWidget {
  static const String id = 'LaunchScreen';
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

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
              ECCCBlueCarLogo(
                adjustLogoSize: false,
              ),
              LogoText(),
              // Sign In Button
              // onPressed: Navigates the user to Sign In screen

              RoundedButton(
                rbColor: ECCCBlueAccent,
                title: 'Sign In',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    SignIn.id,
                  );
                },
              ),

              // Used as a spacer between the buttons
              kSpacerBox,

              // Sign Up Button
              // onPressed:  Navigates the user to the Sign in screen
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    SignUp.id,
                  );
                },
                child: Text(
                  'Sign Up',
                  style: kOutLineButtonTextStyle,
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: ECCCBlueAccent,
                    width: 2,
                  ),
                  padding: EdgeInsets.all(
                    12,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
