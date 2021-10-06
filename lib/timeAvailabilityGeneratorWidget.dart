import 'package:flutter/material.dart';
import 'constants.dart';
import 'models/Buttons/TimeTileButton.dart';

///DATE: 08/23/21
///AUTHOR: MARIO H. C. H.
/// CLASSNAME: TimeAvailabilityGenerator
///
/// PARAMETERS: timesAvailable: variable that represents the total number of available time
///             slots for users to schedule a wash.
///             time:
///
/// DESCRIPTION: Generates the TimeTileButtons for the user to select the time from based on parameters passed.
///              Uses a gridView.Builder to organize and generate the tiles.

///TODO: Get selection of time widget to be displayed visually by changing the color of the tile.
///TODO 1: would converting to a class that is stateless help drill up the statefullness.
///
class TimeTileGeneratorS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TimeTileGenerator extends StatefulWidget {
  /// Amount of timeslots available for the focused day.
  final int timesAvailable;

  TimeTileGenerator({
    this.timesAvailable,
  });

  @override
  _TimeTileGeneratorState createState() => _TimeTileGeneratorState();
}

class _TimeTileGeneratorState extends State<TimeTileGenerator> {
  @override
  Widget build(BuildContext context) {
    /// the amount of time tiles available for the selected date.
    int _timesAvailable = widget.timesAvailable;

    /// the time selected by the user.
    //int scheduledTime = -1;

    int selectedTimeIndex = 0;

    /// Message to be displayed if no times are available for selected day
    if (_timesAvailable == 0) {
      return Center(
          child: Text(
        'No times available for selected date.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Vollkorn',
          fontSize: 30,
          color: ECCCBlueAccent,
        ),
      ));
    }

    /// TimeTilesButtons being generated
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,

      /// The timeTilesButton GridView.Builder a builder variation was chosen
      /// so that a tile can be generated for the available time slots whose
      /// value is represented by _timesAvailable.
      child: GridView.builder(
        primary: false,
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
            crossAxisCount: 3),
        itemCount: _timesAvailable,
        itemBuilder: (BuildContext context, int index) {
          return TimeTileButton(
            timeTextWidget: Center(
              child: index == 3
                  ? Text(
                      '12:00',
                    )
                  : Text(
                      '${(index + _timesAvailable) % 12}:00  ',
                    ),
            ),
            onPressed: () {
              setState(() {
                if (selectedTimeIndex == index) {
                  print('Pressed same time slot');
                  selectedTimeIndex = -1;
                } else {
                  print('New time slot selected');
                  selectedTimeIndex = index;
                }
              });
            },
            tileColor:
                selectedTimeIndex == index ? ECCCDarkBlue : ECCCBlueAccent,
          );
        },
      ),
    );
  }
}
