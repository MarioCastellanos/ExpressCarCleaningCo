import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

/// CLASSNAME:
/// PARAMETERS:
/// DESCRIPTION:

class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _auth = FirebaseAuth.instance;

  User _loggedInUser;

  void getCurrentUser() {
    try {
      final _user = _auth.currentUser;
      if (_user != null) {
        _loggedInUser = _user;
        print(_loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          _loggedInUser.email,
        ),
      ),
    );
  }
}
