import 'package:flutter/material.dart';
import 'constants.dart';

///FUNCTION NAME:
///PARAMETERS: Function profileButtonPressed:
///            iconButtonPressed :
///DESCRIPTION: /// GetAppBar returns a custom app bar based on parameters

PreferredSizeWidget getAppBar({
  @required Function iconButtonPressed,
  Function profileButtonPressed,
  @required bool needsProfileButton,
}) {
  if (needsProfileButton) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 15,
            child: Image.asset(
              'images/carLogo.jpg',
            ),
            alignment: Alignment.bottomCenter,
          ),
          SizedBox(
            width: 25,
          ),
        ],
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: 36,
          color: ECCCBlueAccent,
        ),
        onPressed: iconButtonPressed,
      ),
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.person,
            size: 36,
            color: ECCCBlueAccent,
          ),
          onPressed: profileButtonPressed,
        )
      ],
      backgroundColor: Colors.white,
    );
  } else {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 15,
            child: Image.asset(
              'images/carLogo.jpg',
            ),
            alignment: Alignment.bottomCenter,
          ),
          SizedBox(
            width: 25,
          ),
        ],
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: 36,
          color: ECCCBlueAccent,
        ),
        onPressed: iconButtonPressed,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
