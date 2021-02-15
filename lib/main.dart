import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/screens/RequestQuote.dart';
import 'package:cta_auto_detail/screens/home.dart';
import 'package:cta_auto_detail/screens/launchScreen.dart';
import 'package:cta_auto_detail/screens/profile.dart';
import 'package:cta_auto_detail/screens/resetPassword.dart';
import 'package:cta_auto_detail/screens/scheduleCarWash.dart';
import 'package:cta_auto_detail/screens/servicesOffered.dart';
import 'package:cta_auto_detail/screens/sharedPreferences.dart';
import 'package:cta_auto_detail/screens/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/PopUpScreen.dart';
import 'screens/signUp.dart';
import 'screens/singIn.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // checking
  bool _initialized = false;

  //
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
        print(_initialized);
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
        print(_error);
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CarData(),
      child: MaterialApp(
        onGenerateRoute: (settings) {
          // If you push the PassArguments route
          if (settings.name == ProfileScreen.id) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguments args = settings.arguments;

            // Then, extract the required data from the arguments and
            // pass the data to the correct screen.
            return MaterialPageRoute(
              builder: (context) {
                return ProfileScreen(
                  carData: args.carData,
                );
              },
            );
          }
          if (settings.name == ScheduleCarWash.id) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguments args = settings.arguments;

            // Then, extract the required data from the arguments and
            // pass the data to the correct screen.
            return MaterialPageRoute(
              builder: (context) {
                return ScheduleCarWash(
                  carData: args.carData,
                );
              },
            );
          }

          if (settings.name == RequestQuote.id) {
            // Cast the arguments to the correct type: ScreenArguments.
            final ScreenArguments args = settings.arguments;

            // Then, extract the required data from the arguments and
            // pass the data to the correct screen.
            return MaterialPageRoute(
              builder: (context) {
                return RequestQuote(
                  carData: args.carData,
                );
              },
            );
          }
          assert(false, 'Need to implement ${settings.name}');
          return null;
        },
        theme: ThemeData(
          primaryColor: Color(0xFF025298),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: LaunchScreen.id,
        routes: {
          SignIn.id: (context) => SignIn(),
          SignUp.id: (context) => SignUp(),
          HomeScreen.id: (context) => HomeScreen(),
          LaunchScreen.id: (context) => LaunchScreen(),
          SharedPreferencesDemo.id: (context) => SharedPreferencesDemo(),
          PopUpCard.id: (context) => PopUpCard(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          ResetPasswordScreen.id: (context) => ResetPasswordScreen(),
          ExtractArgumentsScreen.routeName: (context) =>
              ExtractArgumentsScreen(),
          ServicesOffered.id: (context) => ServicesOffered(),
        },
      ),
    );
  }
}

class ScreenArguments {
  final CarData carData;
  ScreenArguments(this.carData);
}
