import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:cta_auto_detail/screens/PopUpScreen.dart';
import 'package:cta_auto_detail/screens/scheduleCarWash.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/models/TextFieldModels.dart';

class ProfileScreen extends StatefulWidget {

  static const String id = 'profileScreen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List<String> addressList;
  CarData carData;

  @override
  // ignore: must_call_super
  void initState() {
    addressList = [];
    carData = CarData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios, color: Colors.redAccent, size: 36,),
        ),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container( height: 15, width: 15,  child: Image.asset('images/RedCarIconAppBar.png'),),
            SizedBox(width: 5,),
            Text('PROFILE',
              textAlign: TextAlign.center,
              style: TextStyle(color: ExpressCarWashRedAccent, fontFamily:  'Vollkorn',),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatarAndTextFields(
            onTap: () {
              print('Needs to be implemented');
            },
          ),
          SizedBox(height: 10,),
          AddressesRow(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: HalfScreenCard(
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
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(

        splashColor: ExpressCarWashRED,
        onPressed: () async{
          var car = await Navigator.pushNamed(context, PopUpCard.id);
          if (car != null){
            List<String> carInfoList = car;
            setState(() {
              carData.addCar(model: carInfoList[0],make: carInfoList[1],interior: carInfoList[2]);
            });
          }
        },
        backgroundColor: Colors.white,
        elevation: 10,
        child: Icon(Icons.add, color: ExpressCarWashRED,size: 36,),
      ),
    );
  }
}