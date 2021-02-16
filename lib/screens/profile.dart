import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:cta_auto_detail/screens/PopUpScreen.dart';
import 'package:cta_auto_detail/models/CarListGridViewBuilder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/models/TextFieldModels.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// TODO : Generate CarCards from shared preferences data using list of strings

class ProfileScreen extends StatefulWidget {
  static const String id = 'profileScreen';
  final CarData carData;

  ProfileScreen({this.carData});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userEmail = FirebaseAuth.instance.currentUser.email;
  String displayName = FirebaseAuth.instance.currentUser.displayName;

  List<String> addressList;

  @override
  void initState() {
    super.initState();
    addressList = [];
    print('Car Data: ${widget.carData.carsList[0].make}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(iconButtonPressed: () {
        Navigator.pop(context);
      }),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatarAndTextFields(
            email: userEmail,
            onTap: () {
              print('Needs to be implemented');
            },
          ),
          kSpacerBox,
          AddressesRow(),
          kSpacerBox,
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: HalfScreenCard(
                childWidget: CarListGridViewBuilder(carData: widget.carData),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: ECCCBlue,
        onPressed: () async {
          var car = await Navigator.pushNamed(context, PopUpCard.id);
          if (car != null) {
            List<String> carInfoList = car;
            setState(() {
              widget.carData.addCar(
                  model: carInfoList[0],
                  make: carInfoList[1],
                  interior: carInfoList[2]);
            });
          }
        },
        backgroundColor: Colors.white,
        elevation: 10,
        child: Icon(
          Icons.add,
          color: ECCCBlue,
          size: 36,
        ),
      ),
    );
  }
}
