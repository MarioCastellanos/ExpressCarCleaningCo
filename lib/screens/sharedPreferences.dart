import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo extends StatefulWidget {
  static const id = 'SharedPreferencesDemo';

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<List<String>> _carsList;
  List<String> carsList = ['Buggati', 'Chiron', 'Alcantara'];

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    carsList.add('hello');
    setState(() {
      _carsList =
          prefs.setStringList("carsList", carsList).then((bool success) {
        return carsList;
      });
    });
    final List<String> farsList = (prefs.getStringList('carsList'));
    print('carsList $farsList');
  }

  @override
  void initState() {
    super.initState();
    _carsList = _prefs.then((SharedPreferences prefs) {
      return (prefs.getStringList('carsList') ?? carsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences Demo"),
      ),
      body: Column(
        children: [
          Center(
            child: FutureBuilder<List<String>>(
              future: _carsList,
              builder:
                  (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
