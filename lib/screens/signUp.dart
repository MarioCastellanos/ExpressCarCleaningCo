import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/RoundedButton.dart';
import 'package:cta_auto_detail/screens/singIn.dart';
import 'package:cta_auto_detail/screens/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/models/TextFieldModels.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Sign up Screen

class SignUp extends StatefulWidget {
  static const String id = 'signUp_screen';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
              RedCarLogo(),
              kSpacerBox,
              EmailTextField(
                errorText: emailErrorText,
                onChanged: (value) {
                  _email = value;
                },
              ),
              kSpacerBox,
              EmailTextField(
                errorText:  confirmEmailErrorText,
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
                rbColor: ExpressCarWashRedAccent,
                title: 'Sign Up ',
                onPressed: () async {
                  if(_email  == _confirmEmail){
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(
                          email: _email, password: _password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      }
                    } catch (e) {
                      print(e.code );
                      setErrorText(e.code);
                    }
                  }else{
                    setState(() {
                      emailErrorText  = 'email does not match confirmation email';
                      confirmEmailErrorText = 'confirmation email does not match email';
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
                    color: ExpressCarWashRED,
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
