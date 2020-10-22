import 'dart:ui';
import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/RoundedButton.dart';
import 'package:cta_auto_detail/models/TextFieldModels.dart';
import 'package:cta_auto_detail/screens/signUp.dart';
import 'package:cta_auto_detail/screens/singIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LaunchScreen extends StatefulWidget {
  static const String id = 'LaunchScreen';
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Logo(),
            AnimatedTextLogo(),
            RoundedButton(
              rbColor: ExpressCarWashRedAccent,
              title: 'Sign In',
              onPressed: () {
                Navigator.pushNamed(context, SignIn.id);
              },
            ),
            SizedBox(
              height: 8,
            ),
            OutlineButton(
              onPressed: () {
                Navigator.pushNamed(context, SignUp.id);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(12),
              color: ExpressCarWashRedAccent,
              child: Text(
                'Sign Up',
                style: TextStyle(color: ExpressCarWashRedAccent, fontSize: 15),
              ),
              borderSide: BorderSide(color: ExpressCarWashRedAccent, width: 2),
              disabledBorderColor: ExpressCarWashRedAccent,
            ),
          ],
        ),
      ),
    );
  }
}
