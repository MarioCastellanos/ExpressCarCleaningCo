import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/models/TextFieldModels.dart';
import 'package:cta_auto_detail/models/RoundedButton.dart';
import 'signUp.dart';


class SignIn extends StatefulWidget {
  static const String id = 'signIn_screen';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with TickerProviderStateMixin{

  bool obscureText = true;
  double opacityLevel = 1.0;

  String _email;
  String _password;

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
              EmailTextField(onChanged: (value){
                _email = value;
              },),
              SizedBox(height: 10,),
              PassWordTextField(
                onChanged: (value){
                  _password = value;
                  print(_password);
                },
                obscureText: obscureText,
                visibilityIconData: ksetVisibility(obscureText),
                setVisibility: (){
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
              SizedBox(height: 10,),
              RoundedButton(
                rbColor: ExpressCarWashRedAccent,
                title: 'Sign In',
                onPressed: (){
                  Navigator.pushNamed(context, HomeScreen.id);
                },
              ),
              SizedBox(height: 10,),
              InkWell(
                child: Text(
                  'Reset Password?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: ExpressCarWashRED,
                    fontSize: 16,
                  ),
                ),
                onTap: (){Navigator.pushNamed(context, SignUp.id);},
              )
            ],
          ),
        ),
      ),
    );
  }
}





