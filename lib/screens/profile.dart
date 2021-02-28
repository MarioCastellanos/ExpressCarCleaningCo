import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:cta_auto_detail/screens/PopUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/models/TextFieldModels.dart';
import 'package:cta_auto_detail/models/CarCard.dart';
import 'package:flutter/services.dart';

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
  int selectedCarIndex = -1;
  int currentIndex;

  @override
  void initState() {
    super.initState();
    addressList = [];
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        iconButtonPressed: () {
          Navigator.pop(context);
        },
        needsProfileButton: false,
      ),
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
                childWidget: GridView.builder(
                  itemCount: widget.carData.carsList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return CarCard(
                      carIndex: index,
                      onPressed: () {
                        selectedCarIndex = index;
                        if (currentIndex == selectedCarIndex) {
                          setState(() {
                            print(index);
                            currentIndex = -2;
                            selectedCarIndex = -1;
                          });
                        } else {
                          setState(() {
                            print(index);
                            selectedCarIndex = index;
                            currentIndex = index;
                          });
                        }
                      },
                      carCardColor:
                          selectedCarIndex == index ? ECCCBlue : Colors.white,
                      title: widget.carData.carsList[index].make,
                    );
                  },
                ),
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
                interior: carInfoList[2],
                newCar: true,
              );
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
