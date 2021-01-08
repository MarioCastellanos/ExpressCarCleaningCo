import 'package:cta_auto_detail/constants.dart';
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
    );
  }
}
