import 'package:flutter/material.dart';
import 'package:cta_auto_detail/constants.dart';


class GetAQuote extends StatelessWidget {
  static const String id = 'GetAQuote';

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
