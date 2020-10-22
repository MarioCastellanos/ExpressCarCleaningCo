import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/screens/CustomPageWidget.dart';
import 'package:cta_auto_detail/screens/home.dart';
import 'package:cta_auto_detail/screens/launchScreen.dart';
import 'package:cta_auto_detail/screens/profile.dart';
import 'package:cta_auto_detail/screens/scheduleCarWash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/PopUpScreen.dart';
import 'screens/signUp.dart';
import 'screens/singIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (BuildContext context) => CarData(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFF025298),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: LaunchScreen.id,
        routes: {
          SignIn.id : (context) =>  SignIn(),
          SignUp.id : (context) =>  SignUp(),
          HomeScreen.id : (context) => HomeScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          LaunchScreen.id : (context) => LaunchScreen(),
          PopUpCard.id : (context) => PopUpCard(),
          ScheduleCarWash.id : (context) => ScheduleCarWash(),
          CustomPaintWidget.id : (context) => CustomPaintWidget(),
        },
      ),
    );
  }
}