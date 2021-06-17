import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/Address_Data.dart';
import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:cta_auto_detail/models/RoundedButton.dart';
import 'package:cta_auto_detail/screens/PopUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/models/TextFieldModels.dart';
import 'package:cta_auto_detail/models/CarCard.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profileScreen';
  final CarData carData;
  final AddressData addressData;

  ProfileScreen({this.carData, this.addressData});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _streetAddressFormKey = GlobalKey<FormState>();
  final _cityFormKey = GlobalKey<FormState>();
  final _stateFormKey = GlobalKey<FormState>();
  final _zipFormKey = GlobalKey<FormState>();

  String userEmail = FirebaseAuth.instance.currentUser.email;
  String streetAddress = '';
  String city = '';
  String state = '';
  String zipCode = '';

  bool addressEntered = false;

  int selectedCarIndex = -1;
  int currentIndex;

  @override
  void initState() {
    super.initState();
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatarAndTextFields(
              email: userEmail,
              onTap: () {
                print('Needs to be implemented');
              },
            ),
            Flexible(
              flex: 1,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ECCCBlueAccent.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SavedLocationsTextWidget(),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: widget.addressData.addressCount,
                            itemBuilder: (context, index) {
                              return addressContainer(index);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              blurRadius: 4,
                              spreadRadius: 4,
                              offset: Offset(0, 4))
                        ],
                        shape: BoxShape.circle,
                        color: ECCCBlue,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet<dynamic>(
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Wrap(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          'New Address',
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontFamily: 'Vollkorn',
                                            color: ECCCDarkBlue,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        AddressFieldForm(
                                          onChange: (streetAddressValue) {
                                            streetAddress = streetAddressValue;
                                          },
                                          addressFormKeyValue:
                                              _streetAddressFormKey,
                                          hintText: 'Street Address',
                                          icon: Icon(
                                            Icons.house,
                                            color: ECCCDarkBlue,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: AddressFieldForm(
                                                onChange: (cityValue) {
                                                  city = cityValue;
                                                },
                                                hintText: 'City',
                                                icon: Icon(
                                                  Icons.location_city,
                                                  color: ECCCDarkBlue,
                                                ),
                                                addressFormKeyValue:
                                                    _cityFormKey,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: AddressFieldForm(
                                                onChange: (cityValue) {
                                                  city = cityValue;
                                                },
                                                hintText: 'State',
                                                icon: Icon(
                                                  Icons.location_pin,
                                                  color: ECCCDarkBlue,
                                                ),
                                                addressFormKeyValue:
                                                    _stateFormKey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        kSpacerBox,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: AddressFieldForm(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Zipcode left empty';
                                                  } else if (value.length !=
                                                      5) {
                                                    return 'zipcode invalid';
                                                  }
                                                  return null;
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                                onChange: (zipCodeValue) {
                                                  zipCode = zipCodeValue;
                                                  print(zipCode);
                                                  if (_zipFormKey.currentState
                                                      .validate()) {
                                                    print('IN IFF STATEMENT');
                                                    setState(
                                                      () {
                                                        addressEntered = true;
                                                      },
                                                    );
                                                  }
                                                },
                                                icon: Icon(Icons.location_pin),
                                                hintText: 'ZipCode',
                                                addressFormKeyValue:
                                                    _zipFormKey,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Container(
                                                  color: Colors.transparent,
                                                )),
                                          ],
                                        ),
                                        kSpacerBox,
                                        ContinueButton(
                                          title: 'Add Address',
                                          textColor: Colors.white,
                                          cBColor: addressEntered
                                              ? ECCCBlue
                                              : Colors.grey,
                                          onPressed: addressEntered
                                              ? () {
                                                  Navigator.pop(context);

                                                  setState(() {
                                                    widget.addressData
                                                        .addAddress(
                                                      streetAddress:
                                                          streetAddress,
                                                      city: city,
                                                      state: state,
                                                      zipCode: zipCode,
                                                      newAddress: true,
                                                    );
                                                  });
                                                  addressEntered = false;
                                                }
                                              : () {},
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(
                          Icons.add_location,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
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

  Container addressContainer(int index) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Icon(
                Icons.home,
                color: ECCCBlueAccent,
                size: 30,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${widget.addressData.addressList[index].streetAddress}\n'
                '${widget.addressData.addressList[index].city}\t ${widget.addressData.addressList[index].state}\n'
                '${widget.addressData.addressList[index].zipCode}',
                style: TextStyle(
                  color: ECCCBlueAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
