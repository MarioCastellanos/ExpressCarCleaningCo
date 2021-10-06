import 'package:flutter/material.dart';
import 'package:express_car_cleaning_co/constants.dart';

/// AUTHOR: MARIO H.C.H.
/// DATE : 08/24/21
/// CLASSNAME: TimeTileButton
///
/// PARAMETERS: childWidget: Determines what is displayed on top of the gesture
///                          detector.
///             onPressed:  Determines what to do when the button is pressed
///             scheduledTime:
///             cardColor:
///
/// DESCRIPTION: A card that represents the button the user presses when selecting
///              a time for the car wash.

class TimeTileButton extends StatelessWidget {
  // Child widget to represent the time
  final Widget timeTextWidget;
  // Determines what to do when tile is selected
  final Function onPressed;

  final Color tileColor;

  TimeTileButton({
    this.tileColor = ECCCBlueAccent,
    @required this.timeTextWidget,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Center(
        child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: tileColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: timeTextWidget),
      ),
    );
  }
}
