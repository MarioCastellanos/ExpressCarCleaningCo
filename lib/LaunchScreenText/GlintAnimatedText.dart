import 'package:flutter/material.dart';
import 'package:cta_auto_detail/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

/// CLASSNAME: GlintAnimatedText
/// PARAMETERS: NONE
/// DESCRIPTION: Animated text that states "Car Wash Delivered" is designed to appear
///              like the glint of light on freshly washed car. This is achieved using the
///              Animated Text Widget.

class GlintAnimatedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColorizeAnimatedTextKit(
      text: ['Car Wash Delivered'],
      isRepeatingAnimation: false,
      speed: Duration(milliseconds: 250),
      colors: [
        ECCCBlue,
        Colors.white,
        ECCCBlue,
      ],
      textStyle: TextStyle(
        fontSize: 36,
        fontFamily: 'Vollkorn',
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.start,
    );
  }
}
