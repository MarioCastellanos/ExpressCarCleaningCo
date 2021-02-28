import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/CarCard.dart';
import 'package:flutter/services.dart';

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
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  int selectedCarIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        iconButtonPressed: () {
          Navigator.pop(context);
        },
        needsProfileButton: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ReusableCard(
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
                    carCardColor:
                        selectedCarIndex == index ? ECCCBlue : Colors.white,
                    onPressed: () {
                      setState(() {
                        print(index);
                        selectedCarIndex = index;
                      });
                    },
                    title: widget.carData.carsList[index].make,
                  );
                },
              ),
              onPressed: () {
                print('fart');
              },
              cardColor: ECCCBlueAccent,
            ),
            ReusableCard(
              childWidget: null,
              onPressed: null,
              cardColor: ECCCBlueAccent,
            ),
            ReusableCard(
              childWidget: null,
              onPressed: null,
              cardColor: ECCCBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
