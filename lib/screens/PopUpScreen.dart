import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:cta_auto_detail/models/RoundedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopUpCard extends StatefulWidget {
  static const id = 'PopUpCard';

  @override
  _PopUpCardState createState() => _PopUpCardState();
}

class _PopUpCardState extends State<PopUpCard> {
  bool splash;

  Function continueFunction;

  String displayText;
  String make;
  String model;

  int currScreen = 1;
  int currIndex;

  List<String> currList = [];

  void upDateUI(int i) {
    switch (i) {
      case 1:
        {
          splash = false;
          displayText = 'What make is your vehicle?';
          currIndex = -1;
          currList = carMakeList;
        }
        break;

      case 2:
        {
          splash = false;
          make = currList[currIndex];
          displayText = 'What model is your $make ? ';
          currList = carMakesModelsMap[make];
          currIndex = -1;
        }
        break;

      case 3:
        {
          splash = false;
          model = currList[currIndex];
          displayText = 'Interior upholstered in?';
          currList = kInteriorOptionsList;
          currIndex = -1;
        }
        break;
    }
  }

  @override
  // ignore: must_call_super
  void initState() {
    currList = [];
    upDateUI(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 36,
            color: ECCCBlueAccent,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
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
                  color: ECCCBlueAccent,
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
                    itemCount: currList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CarInfoCard(
                        info: currList[index],
                        color: currIndex == index ? ECCCDarkBlue : Colors.white,
                        onTap: () {
                          setState(() {
                            splash = true;
                            currIndex = index;
                          });
                        },
                        textColor:
                            currIndex == index ? Colors.white : Colors.black,
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: ContinueButton(
                  splashValue: splash,
                  title: currIndex == -1 ? '' : 'CONTINUE',
                  textColor: Colors.white,
                  onPressed: () {
                    if (currIndex != -1 && currScreen != 3) {
                      setState(() {
                        currScreen++;
                        upDateUI(currScreen);
                      });
                    } else {
                      if (currScreen == 3) {
                        Navigator.pop(
                            context, [make, model, currList[currIndex]]);
                      }
                    }
                  },
                  cBColor: currIndex == -1 ? Colors.white : ECCCBlueAccent),
            )
          ],
        ),
      ),
    );
  }
}
