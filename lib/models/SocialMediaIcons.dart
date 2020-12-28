import 'package:cta_auto_detail/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SocialMediaIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ExpressCarWashRedAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(.5),
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(0, 3))
              ],
            ),
            child: FaIcon(
              FontAwesomeIcons.facebook,
              color: Colors.black,
              size: 30,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ExpressCarWashRedAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(.5),
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(0, 3))
              ],
            ),
            child: FaIcon(
              FontAwesomeIcons.instagram,
              color: Colors.black,
              size: 30,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ExpressCarWashRedAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(.5),
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(0, 3))
              ],
            ),
            child: FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}