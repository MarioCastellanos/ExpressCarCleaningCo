import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/screens/home.dart';
import 'package:cta_auto_detail/screens/resetPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/models/TextFieldModels.dart';
import 'package:cta_auto_detail/models/RoundedButton.dart';

// SignIn Screen handles users trying to log in. Only log in method available is
// email and password at the moment.

class SignIn extends StatefulWidget {
  static const String id = 'signIn_screen';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with TickerProviderStateMixin {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // Manages the obscureText state of the password textField; default set to true;
  bool obscureText = true;

  // Manages password error state
  bool passwordError;

  // private email & password fields
  String _email;
  String _password;

  // errorText
  String emailErrorText;
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
        }
      },
    );
  }

  // initializing values, chose to set email and password to '' in order to avoid null errors.
  // set email and password error values to initial values.

  @override
  void initState() {
    super.initState();
    _email = '';
    _password = '';
    passwordError = false;
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
              EmailTextField(
                errorText: emailErrorText,
                onChanged: (value) {
                  _email = value;
                },
              ),
              kSpacerBox,
              PassWordTextField(
                errorText: passwordErrorText,
                onChanged: (value) {
                  _password = value;
                },
                obscureText: obscureText,
                visibilityIconData: kSetVisibility(obscureText),
                setVisibility: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
              kSpacerBox,

              /// Sign In Button,
              /// onPressed: is an async function that performs validation of email,
              /// and text field not being left empty. Additionally if no error is detected
              /// a user login is attempted with the given parameters. If a successful login occurs
              /// users are directed to the home page.

              RoundedButton(
                rbColor: ECCCBlueAccent,
                title: 'Sign In',
                onPressed: () async {
                  if (_email == '') {
                    setErrorText(_email);
                  } else if (_password == '') {
                    setErrorText(' ');
                  } else {
                    try {
                      UserCredential userCredential =
                          await _auth.signInWithEmailAndPassword(
                        email: _email,
                        password: _password,
                      );
                      if (userCredential != null) {
                        Navigator.pushNamed(context, HomeScreen.id);
                      }
                    } on FirebaseAuthException catch (e) {
                      print('e.code: ${e.code}');
                      setErrorText(e.code);
                    }
                  }
                },
              ),

              kSpacerBox,

              /* RESET PASSWORD INKWELL
              * onPressed Directs user to resetPasswordScreen
              *
              *
              * */
              InkWell(
                child: Text(
                  'Reset Password?',
                  textAlign: TextAlign.center,
                  style: kInkWellTextStyle,
                ),
                onTap: () {
                  Navigator.pushNamed(context, ResetPasswordScreen.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
