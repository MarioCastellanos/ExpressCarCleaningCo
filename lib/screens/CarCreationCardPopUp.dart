import 'package:express_car_cleaning_co/constants.dart';
import 'package:express_car_cleaning_co/models/CardModels/CarInfoCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:express_car_cleaning_co/models/Buttons/ContinueButton.dart';

/// AUTHOR: MARIO H.C.H
/// CLASSNAME:PopUpCard
///
/// PARAMETERS:NONE
///
/// DESCRIPTION: This card is designed to allow the user to select from
///              the list of cars to find their car and add it to their
///              fleet of cars or use it temporarily to schedule a single car
///              wash.

class CarCreationCardPopUp extends StatefulWidget {
  static const id = 'CarCreationPopUP';

  @override
  _CarCreationCardPopUpState createState() => _CarCreationCardPopUpState();
}

class _CarCreationCardPopUpState extends State<CarCreationCardPopUp> {
  // activated to determine when the
  bool activated;

  // function used for activating the continue button
  Function continueFunction;

  // Text that prompts the user for information depending on what stage of the car
  // selection process they are on
  String displayText;
  // the Make of the car
  String make;
  // the model of the car
  String model;

  // the index in the process of creating a car the user is in
  int carCreationIndex = 1;
  // the index of the CarInfoCard selected by the user.
  int selectedCardIndex;
  // The current index
  int currIndex = -1;

  // list of current info being displayed to user
  List<String> currentCarInfoList = [];

  // FUNCTION NAME: upDateUI
  // Parameters: int i : the current section of the car creation process being shown to the user.
  // Description: Updates elements of the ui to pertain to the list being showed to the user
  //

  void upDateUI(int i) {
    switch (i) {

      /// updating UI to display option for car brands
      case 1:
        {
          activated = false;
          displayText = 'What make is your vehicle?';
          currIndex = -1;
          currentCarInfoList = carMakeList;
        }
        break;

      /// UI is updated to show option for models from the previously selected
      /// make
      case 2:
        {
          activated = false;
          // Saving the make selected from the previous screen
          make = currentCarInfoList[currIndex];
          displayText = 'What model is your $make ? ';
          currentCarInfoList = carMakesModelsMap[make];
          currIndex = -1;
        }
        break;

      /// UI is set to display options for the types of interiors available to the user.
      case 3:
        {
          activated = false;
          model = currentCarInfoList[currIndex];
          displayText = 'Interior upholstered in?';
          currentCarInfoList = kInteriorOptionsList;
          currIndex = -1;
        }
        break;
    }
  }

  @override
  // ignore: must_call_super
  void initState() {
    currentCarInfoList = [];
    // Setting the UI to case 1 in the switch
    upDateUI(1);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Back arrow button in the app bar that returns the user to the previous
        // screen when pressed
        leading: IconButton(
          onPressed: () {
            setState(() {
              // Determining whether to send th user to the previous screen in the car
              // selection process or the screen before the user prompted the creation of the
              // new car object.
              if (carCreationIndex > 1) {
                carCreationIndex--;
                upDateUI(carCreationIndex);
              } else {
                Navigator.pop(context);
              }
            });
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 36,
            color: ECCCBlueAccent,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        // Text being displayed in app bar in accordance to the info being displayed
        title: Text(
          displayText,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ECCCBlueAccent,
              fontFamily: 'Vollkorn',
              fontSize: 26,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54.withOpacity(.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(1, 4))
                  ],
                  color: ECCCDarkBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: currentCarInfoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CarInfoCard(
                        info: currentCarInfoList[index],
                        color:
                            currIndex == index ? Colors.white : ECCCBlueAccent,
                        onTap: () {
                          selectedCardIndex = index;
                          print('selectedIndex $selectedCardIndex');
                          if (selectedCardIndex == currIndex) {
                            setState(() {
                              activated = false;
                              selectedCardIndex = -2;
                              currIndex = -1;
                            });
                          } else {
                            setState(() {
                              activated = true;
                              currIndex = index;
                              selectedCardIndex = index;
                            });
                          }
                        },
                        textColor:
                            currIndex == index ? Colors.black : Colors.white,
                      );
                    },
                  ),
                ),
              ),
            ),
            kSpacerBox,
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: ContinueButton(
                  activated: activated,
                  title: 'CONTINUE',
                  textColor: Colors.white,
                  onPressed: () {
                    print('CURRENT INDEX : $currIndex');
                    if (currIndex != -1 && carCreationIndex != 3) {
                      setState(() {
                        carCreationIndex++;
                        upDateUI(carCreationIndex);
                      });
                    } else {
                      if (carCreationIndex == 3) {
                        Navigator.pop(context,
                            [make, model, currentCarInfoList[currIndex]]);
                      }
                    }
                  },
                  cBColor: currIndex == -1 ? Colors.grey : ECCCBlueAccent),
            )
          ],
        ),
      ),
    );
  }
}
