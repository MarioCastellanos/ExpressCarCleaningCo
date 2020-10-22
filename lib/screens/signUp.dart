import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/RoundedButton.dart';
import 'package:cta_auto_detail/screens/singIn.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/models/TextFieldModels.dart';


/// Sign up Screen
///


class SignUp extends StatefulWidget {
  static const String id = 'signUp_screen';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscureText = true;
  String email;
  String confirmEmail;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: kBlackBlueGradientDecoration,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Logo(),
              SizedBox(height: 10,),
              EmailTextField(
                onChanged: (value){
                  email = value;
                },
              ),
              SizedBox(height: 10,),
              EmailTextField(
                onChanged: (value){
                  confirmEmail = value;
                },
              ),
              SizedBox(height: 10,),
              PassWordTextField(
                onChanged: (value){
                  password = value;
                },
                obscureText: obscureText,
                visibilityIconData: obscureText ? Icons.visibility_off : Icons.visibility,
                setVisibility: (){
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
              SizedBox(height: 10,),
              RoundedButton(
                rbColor: ExpressCarWashRedAccent,
                title: 'Sign Up ',
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 10,),
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
                onTap: (){Navigator.pushNamed(context, SignIn.id);},
              )
            ],
          ),
        ),
      ),
    );
  }
}
