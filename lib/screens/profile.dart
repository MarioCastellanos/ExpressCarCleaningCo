import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:cta_auto_detail/screens/PopUpScreen.dart';
import 'package:cta_auto_detail/screens/scheduleCarWash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cta_auto_detail/models/TextFieldModels.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {

  static const String id = 'profileScreen';

  ProfileScreen({this.carData});

  final CarData carData;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  FirebaseAuth _auth = FirebaseAuth.instance;


  List<String> addressList;


  @override
  void initState() {
    super.initState();
    var carsList = FirebaseFirestore.instance.collection('CarCollection');
    print(carsList);
    addressList = [];
    print('Car Data: ${widget.carData.carsList[0].make}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(iconButtonPressed: (){Navigator.pop(context);}),
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
                childWidget: CarListGridViewBuilder(carData: widget.carData),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(

        splashColor: ECCCBlue,
        onPressed: () async{
          var car = await Navigator.pushNamed(context, PopUpCard.id);
          if (car != null){
            List<String> carInfoList = car;
            setState(() {
              widget.carData.addCar(model: carInfoList[0],make: carInfoList[1],interior: carInfoList[2]);
            });
          }
        },
        backgroundColor: Colors.white,
        elevation: 10,
        child: Icon(Icons.add, color: ECCCBlue,size: 36,),
      ),
    );
  }
}

class CarListGridViewBuilder extends StatelessWidget {
  const CarListGridViewBuilder({@required this.carData,});

  final CarData carData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
    );
  }
}