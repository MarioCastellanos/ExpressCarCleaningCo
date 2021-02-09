import 'package:cta_auto_detail/constants.dart';
import 'package:cta_auto_detail/models/CarWashPackage.dart';
import 'package:cta_auto_detail/models/ReusableCard.dart';
import 'package:flutter/material.dart';

class ServicesOffered extends StatelessWidget {
  static const String id = 'Services Offered';

  /// TODO: Make scrollbar visible at all times to make ui more user friendly

  final ScrollController _diamondScrollController = ScrollController();
  final ScrollController _sapphireScrollController = ScrollController();
  final ScrollController _rubyScrollController = ScrollController();
  final ScrollController _emeraldScrollController = ScrollController();

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
                childWidget: CarWashPackage(
                  scrollController: _diamondScrollController,
                  packageTitle: 'Diamond \$ 220',
                  packageTitleStyle: kDiamondTextStyle,
                  packageDetails: kDiamondPackageDetails,
                ),
              ),
              ReusableCard(
                  onPressed: () {},
                  cardColor: ECCCBlueAccent,
                  childWidget: CarWashPackage(
                    scrollController: _sapphireScrollController,
                    packageTitle: 'Sapphire \$ 160',
                    packageTitleStyle: sapphireTextStyle,
                    packageDetails: kSapphirePackageDetails,
                  )),
              ReusableCard(
                onPressed: () {},
                cardColor: ECCCBlueAccent,
                childWidget: CarWashPackage(
                  scrollController: _rubyScrollController,
                  packageTitle: 'Ruby \$ 140',
                  packageTitleStyle: rubyTextStyle,
                  packageDetails: kRubyPackageDetails,
                ),
              ),
              ReusableCard(
                onPressed: () {},
                cardColor: ECCCBlueAccent,
                childWidget: CarWashPackage(
                  scrollController: _emeraldScrollController,
                  packageTitle: 'Emerald \$ 100',
                  packageTitleStyle: emeraldTextStyle,
                  packageDetails: kEmeraldPackageDetails,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
