import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:flutter/material.dart';

class ScheduleCarWash extends StatefulWidget {
  static const String id = 'ScheduleCarWash';
  @override
  _ScheduleCarWashState createState() => _ScheduleCarWashState();
}

class _ScheduleCarWashState extends State<ScheduleCarWash> {
  int contentIndex;
  CarData carData;

  @override
  void initState() {
    super.initState();
    contentIndex = 1;
    carData = CarData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(height: 25, width: 25, child: Image.asset('images/RedCarIconAppBar.png')),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            print('pop');
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ExpressCarWashRedAccent,
            size: 36,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: getChildren(contentIndex),
        ),
      ),
    );
  }

  List<Widget> getChildren(int i) {
    // content switch
    switch (i) {

      // user car selection
      case 1:
        {
          return <Widget>[
            ReusableCard(
              onPressed: () {
                print('fart');
              },
              cardColor: ExpressCarWashRedAccent,
              childWidget: Text(
                'Select a vehicle',
                style: TextStyle(
                  fontSize: 45,
                  fontFamily: 'Vollkorn',
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ReusableCard(
                childWidget: GridView.builder(
                  itemCount: carData.carsList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return CarCard(
                      onPressed: () {
                        Navigator.pushNamed(context, ScheduleCarWash.id);
                      },
                      title: carData.carsList[index].make,
                    );
                  },
                ),
                onPressed: (){
                  print('fart');
                },
                cardColor: Colors.red,
              ),
            ),
          ];
        }
        break;

      // user selecting time and
      case 2:
        {
          return <Widget>[];
        }
        break;

      case 3:
        {
          return <Widget>[];
        }
        break;
    }
    return <Widget>[];
  }
}
