import 'package:express_car_cleaning_co/models/Buttons/ContinueButton.dart';
import 'package:express_car_cleaning_co/models/DataModels/Car_Data.dart';
import 'package:express_car_cleaning_co/models/CardModels/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:express_car_cleaning_co/screens/CarCreationCardPopUp.dart';
import 'package:express_car_cleaning_co/constants.dart';
import 'package:express_car_cleaning_co/models/CardModels/CarCard.dart';
import 'package:flutter/services.dart';
import 'package:express_car_cleaning_co/AppBarFunction.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:express_car_cleaning_co/models/WaveCustomPainter.dart';
import 'package:express_car_cleaning_co/models/Objects/CarWashPackage.dart';

/// CLASSNAME: RequestQuote
///
/// PARAMETERS: CarData: List of cars being stored by shared preferences.
///
/// DESCRIPTION: Designed to allow the user to request a quote before scheduling a
///              car wash service.

class RequestQuote extends StatefulWidget {
  static const String id = 'RequestQuote';

  RequestQuote({
    this.carData,
  });

  final CarData carData;

  @override
  _RequestQuoteState createState() => _RequestQuoteState();
}

class _RequestQuoteState extends State<RequestQuote> {
  // Represents the package number being selected is stored so that we can use
  // it to send to our firebase storage.
  int packageNumber;

  // Represents the selected car so that it can be highlighted.
  int selectedCarIndex = -1;

  // Used to determine if a car has been selected to allow for a quote request to be made.
  bool carSelected = false;
  //Used to determine if a package has been selected to allow for a quote request to be made.
  bool packageSelected = false;

  // Used to keep track of information regarding the car that has been selected.
  String selectedCarMake = '';
  String selectedCarModel = '';
  String selectedCarTrim = '';

  // List of Car Wash Detaling package names.
  List<String> packageNameList = [
    'Diamond',
    'Sapphire',
    'Ruby',
    'Emerald',
  ];

  // List of car wash package variable names.
  List<Text> packageList = [
    kDiamondPackageDetails,
    kSapphirePackageDetails,
    kRubyPackageDetails,
    kEmeraldPackageDetails,
  ];

  // List of car wash package textStyles
  List<TextStyle> packageTextStyleList = [
    kDiamondTextStyle,
    kSapphireTextStyle,
    kRubyTextStyle,
    kEmeraldTextStyle,
  ];

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Car Selection Card
              ReusableCard(
                flexFactor: 1,
                childWidget: Column(
                  children: [
                    Text(
                      carSelected == false ? 'Select Car' : '',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Vollkorn',
                      ),
                    ),
                    Flexible(
                      flex: 20,
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: GridView.builder(
                          itemCount: widget.carData.carsList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 1,
                            childAspectRatio: 1.3,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return CarCard(
                              carIndex: index,
                              carCardColor: selectedCarIndex == index
                                  ? ECCCBlue
                                  : Colors.white,
                              onPressed: () {
                                setState(() {
                                  print(index);
                                  selectedCarIndex = index;
                                  carSelected = true;
                                });
                              },
                              title: widget.carData.carsList[index].make,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  // Do nothing
                },
                cardColor: ECCCBlueAccent.withOpacity(.5),
              ),

              // Add New Car & Guest Car Button Row
              Row(
                children: [
                  ReusableCard(
                    childWidget: Text(
                      'Guest Car',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      var car = await Navigator.pushNamed(
                          context, CarCreationCardPopUp.id);
                      if (car != null) {
                        List<String> carInfoList = car;
                        setState(() {
                          selectedCarMake = carInfoList[1];
                          selectedCarModel = carInfoList[0];
                          selectedCarTrim = carInfoList[2];
                        });
                      }
                    },
                    cardColor: ECCCBlueAccent,
                  ),
                  ReusableCard(
                    childWidget: Text(
                      'New Car',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      var car = await Navigator.pushNamed(
                          context, CarCreationCardPopUp.id);
                      if (car != null) {
                        List<String> carInfoList = car;
                        setState(() {
                          widget.carData.addCar(
                            model: carInfoList[0],
                            make: carInfoList[1],
                            interior: carInfoList[2],
                            newCar: true,
                          );
                          selectedCarMake = carInfoList[1];
                          selectedCarModel = carInfoList[0];
                          selectedCarTrim = carInfoList[2];
                        });
                      }
                    },
                    cardColor: ECCCBlueAccent,
                  ),
                ],
              ),

              // Select Car Wash Package
              Flexible(
                flex: 2,
                // Blue exterior container
                child: Column(
                  children: [
                    Text(
                      packageSelected == false ? 'Select Package' : '',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Vollkorn',
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ECCCBlueAccent.withOpacity(.5),
                        ),
                        child: Swiper(
                          onTap: (int index) {
                            packageNumber = index;
                            print('PackageNumber = $packageNumber');
                            setState(() {
                              packageSelected = true;
                            });
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: ECCCBlueAccent.withOpacity(.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CustomPaint(
                                painter: Wave(),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 30.0,
                                      right: 8.0,
                                      bottom: 8.0,
                                      left: 8.0),
                                  child: CarWashPackage(
                                    flexTitle: true,
                                    packageTitle: packageNumber == index
                                        ? packageNameList[index] + " Selected"
                                        : packageNameList[index],
                                    packageTitleStyle:
                                        packageTextStyleList[index],
                                    packageDetails: packageList[index],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: 4,
                          loop: false,
                          outer: true,
                          pagination: new SwiperPagination(
                            margin: EdgeInsets.all(10),
                          ),
                          control: null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: ContinueButton(
                  //checking if a car and package have been selected to request a quote.
                  activated: carSelected && packageSelected,
                  title: 'Request Quote',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
