import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cta_auto_detail/models/TextFieldModels.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String id = "ResetPasswordScreen";

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _email;
  String emailErrorText;

  @override
  void initState() {
    super.initState();
    _email = '';
    emailErrorText = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
                onPressed: () {
                  _auth.sendPasswordResetEmail(email: _email);

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
