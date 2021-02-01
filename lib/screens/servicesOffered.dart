import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:flutter/material.dart';

class ServicesOffered extends StatelessWidget {
  static const String id = 'Services Offered';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        iconButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ReusableCard(
                onPressed: () {},
                cardColor: ECCCBlueAccent,
                childWidget: ListView(
                  children: const <Widget>[
                    Text(
                      'Diamond',
                      style: diamondTextStyle,
                    ),
                    Text(
                      
                      '• Hand Wax \n'
                      '• Detailed Exterior Wash\n'
                      '• Tires & Rims hand wash\n'
                      '• Interior Super Clean \n'
                      '• All carpet shampoo \n'
                      '• Full seats deep cleaning \n'
                      '• Trunk deep cleaning',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Vollkorn',
                      ),
                    ),
                  ],
                ),
              ),
              ReusableCard(
                onPressed: () {},
                cardColor: ECCCBlueAccent,
                childWidget: ListView(
                  children: const <Widget>[
                    Text(
                      'Sapphire',
                      style: sapphireTextStyle,
                    ),
                    Text(
                      '• Hand Wax \n'
                      '• Detailed Exterior Wash \n'
                      '• Tires & Rims Hand Wash \n'
                      '• Interior Super Clean \n'
                      '• All Carpet Shampoo \n'
                      '• Full Seats Deep Cleaning \n'
                      '• Trunk Deep Cleaning',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Vollkorn',
                      ),
                    ),
                  ],
                ),
              ),
              ReusableCard(
                onPressed: () {},
                cardColor: ECCCBlueAccent,
                childWidget: ListView(
                  children: const <Widget>[
                    Text(
                      'Ruby',
                      style: rubyTextStyle,
                    ),
                    Text(
                      '• Exterior Wash\n'
                      '• Tires & Rims hand wash\n'
                      '• Interior Light Clean \n'
                      '• All carpet shampoo \n',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Vollkorn',
                      ),
                    ),
                  ],
                ),
              ),
              ReusableCard(
                onPressed: () {},
                cardColor: ECCCBlueAccent,
                childWidget: ListView(
                  children: const <Widget>[
                    Text(
                      'Emerald',
                      style: emeraldTextStyle,
                    ),
                    Text(
                      '• Exterior Wash\n'
                      '• Tires & Rims\n'
                      '• Interior Light Cleaning',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Vollkorn',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
