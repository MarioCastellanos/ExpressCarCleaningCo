import 'dart:async';
import 'package:cta_auto_detail/models/Car_Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:cta_auto_detail/models/CarCard.dart';

///

class SharedPreferencesDemo extends StatefulWidget {
  static const id = 'SharedPreferencesDemo';

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  CarData carData = CarData();
  int selectedCarIndex = -1;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<List<String>> _carsList;
  List<String> carsList;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final List<String> carsList2 = (prefs.getStringList('carsList'));
    carsList2.add('Buggatti');
    setState(() {
      carData.addCar(
        make: carsList[0],
        model: carsList[1],
        interior: carsList[2],
      );
      _carsList =
          prefs.setStringList("carsList", carsList2).then((bool success) {
        return carsList2;
      });
    });

    print('carsList $carsList2');
  }

  void getCarsList() async {
    carsList = await _carsList;
    print(' function carsList from futture equals = $carsList');
    setState(() {
      carData.addCar(
        make: carsList[0],
        model: carsList[1],
        interior: carsList[2],
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _carsList = _prefs.then((SharedPreferences prefs) {
      return (prefs.getStringList('carsList') == null
          ? ['Buggati', 'Chiron', 'Alcantara']
          : prefs.getStringList('carsList'));
    });

    getCarsList();
    print('carsList from futture equals = $carsList');
    //carData.addCar(make: carsList[0], model: carsList[1], interior: carsList[2]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences Demo"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ReusableCard(
              childWidget: GridView.builder(
                itemCount: carData.carsList.length,
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
                    title: carData.carsList[index].make,
                  );
                },
              ),
              onPressed: () {
                print('fart');
              },
              cardColor: ECCCBlueAccent,
            ),
            Center(
              child: FutureBuilder<List<String>>(
                future: _carsList,
                builder: (BuildContext context,
                    AsyncSnapshot<List<String>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    default:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Text(
                          'Button tapped ${snapshot.data} time.\n\n'
                          'This should persist across restarts.',
                        );
                      }
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
