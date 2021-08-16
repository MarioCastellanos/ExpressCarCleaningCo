import 'package:flutter/material.dart';
import 'package:cta_auto_detail/constants.dart';

/// CLASSNAME: ContinueButton
///
/// PARAMETERS: textColor:
///             cBColor:
///             title:
///             onPressed:
///             splashValue:
///
/// DESCRIPTION: A continue button model that defaults to a grey button that indicates the button
///              will not perform the onPress passed

class ContinueButton extends StatelessWidget {
  final Color textColor;
  final Color cBColor;
  final String title;
  final Function onPressed;
  final bool activated;

  ContinueButton({
    this.title,
    this.onPressed,
    this.cBColor = Colors.grey,
    this.textColor,
    @required this.activated,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: activated == false? Colors.grey: ECCCBlueAccent,
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        elevation: 20,
        splashColor: activated == false ? Colors.transparent : ECCCBlue,
        onPressed: activated
            ? onPressed
            : () {
                //Button not active
              },
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
