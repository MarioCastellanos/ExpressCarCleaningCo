import 'package:express_car_cleaning_co/constants.dart';
import 'package:express_car_cleaning_co/models/TextFieldModels/PasswordTextField.dart';
import 'package:express_car_cleaning_co/models/Buttons/RoundedButton.dart';
import 'package:express_car_cleaning_co/screens/singIn.dart';
import 'package:express_car_cleaning_co/screens/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:express_car_cleaning_co/models/widgets/ECCCBlueCarLogo.dart';
import 'package:express_car_cleaning_co/models/TextFieldModels/EmailTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

/// CLASSNAME:
/// PARAMETERS:
/// DESCRIPTION:

class SignUp extends StatefulWidget {
  static const String id = 'signUp_screen';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  final _auth = FirebaseAuth.instance;

  bool obscureText = true;

  String _password;
  String _email;
  String _confirmEmail;

  // Used to manage error text state
  String emailErrorText;
  String confirmEmailErrorText;
  String passwordErrorText;

  // Sets the error message for the email or password field depending on error
  // with email taking priority over password.
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

          // email-already-in-use
          case 'email-already-in-use':
            {
              emailErrorText = 'Email already in use';
            }
            break;

          // Password left blank
          case ' ':
            {
              passwordErrorText = 'Password left blank';
            }
            break;
          // Wrong password.
          case 'wrong-password':
            {
              passwordErrorText = 'Incorrect password';
            }
            break;
          case 'network-request-failed':
            {
              passwordErrorText = 'No Internet Connection';
              emailErrorText = 'No Internet Connection';
            }
            break;
        }
      },
    );
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
                adjustLogoSize: true,
              ),
              kSpacerBox,
              EmailTextField(
                errorText: emailErrorText,
                onChanged: (value) {
                  _email = value;
                },
              ),
              kSpacerBox,
              EmailTextField(
                errorText: confirmEmailErrorText,
                onChanged: (value) {
                  _confirmEmail = value;
                },
              ),
              kSpacerBox,
              PassWordTextField(
                errorText: passwordErrorText,
                onChanged: (value) {
                  _password = value;
                },
                obscureText: obscureText,
                visibilityIconData:
                    obscureText ? Icons.visibility_off : Icons.visibility,
                setVisibility: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
              kSpacerBox,
              RoundedButton(
                rbColor: ECCCBlueAccent,
                title: 'Sign Up ',
                onPressed: () async {
                  if (_email == _confirmEmail) {
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: _email, password: _password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      }
                    } catch (e) {
                      print(e.code);
                      setErrorText(e.code);
                    }
                  } else {
                    setState(() {
                      emailErrorText =
                          'email does not match confirmation email';
                      confirmEmailErrorText =
                          'confirmation email does not match email';
                    });
                  }
                },
              ),
              kSpacerBox,
              InkWell(
                child: Text(
                  'Already have an account? Sign in.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: ECCCBlue,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, SignIn.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
