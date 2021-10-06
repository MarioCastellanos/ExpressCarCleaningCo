import 'package:express_car_cleaning_co/constants.dart';
import 'package:express_car_cleaning_co/models/Buttons/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:express_car_cleaning_co/models/TextFieldModels/EmailTextField.dart';
import 'package:flutter/services.dart';

/// CLASSNAME:
/// PARAMETERS:
/// DESCRIPTION:

class ResetPasswordScreen extends StatefulWidget {
  static const String id = "ResetPasswordScreen";

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _email;
  String emailErrorText;
  bool emailError;

  void setErrorText(String errorCode) {
    setState(
      () {
        switch (errorCode) {
          // Email left blank
          case '':
            {
              emailErrorText = 'Email left blank';
            }
            break;
          // invalid email
          case 'invalid-email':
            {
              emailErrorText = 'Invalid Email';
            }
            break;
          // no user found with that email
          case 'user-not-found':
            {
              emailErrorText = 'User not found';
            }
            break;
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _email = '';
    emailErrorText = '';
    emailError = false;
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter registered email to receive password reset instructions',
                style: kResetPasswordTextStyle,
              ),
              EmailTextField(
                  onChanged: (value) {
                    _email = value;
                  },
                  errorText: emailErrorText),
              RoundedButton(
                rbColor: ECCCBlueAccent,
                title: 'Send Reset Email',
                onPressed: () async {
                  if (_email == '') {
                    setErrorText(_email);
                  } else {
                    try {
                      print('email: $_email');
                      await _auth.sendPasswordResetEmail(email: _email);
                    } on FirebaseAuthException catch (e) {
                      print('e.code: ${e.code}');
                      setErrorText(e.code);
                    }
                  }
                },
              ),
              // RoundedButton(
              //   rbColor: ECCCBlueAccent,
              //   title: 'Send Reset Email',
              //   onPressed: () {
              //     _auth.sendPasswordResetEmail(email: _email);
              //
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
