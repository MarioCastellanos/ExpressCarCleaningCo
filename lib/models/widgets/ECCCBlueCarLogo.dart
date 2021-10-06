import 'package:flutter/material.dart';

class ECCCBlueCarLogo extends StatelessWidget {
  final bool adjustLogoSize;

  ECCCBlueCarLogo({this.adjustLogoSize = false});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'BlueCar',
      child: Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        height: adjustLogoSize == false ? 66 : 166,
        width: 100,
        child: Image.asset(
          'images/carLogo.jpg',
        ),
      ),
    );
  }
}
