import 'package:express_car_cleaning_co/constants.dart';
import 'package:express_car_cleaning_co/models/Objects/CarWashPackage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:express_car_cleaning_co/models/WaveCustomPainter.dart';
import 'package:express_car_cleaning_co/AppBarFunction.dart';

/// CLASSNAME:
/// PARAMETERS:
/// DESCRIPTION:

class ServicesOffered extends StatelessWidget {
  static const String id = 'Services Offered';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        iconButtonPressed: () {
          Navigator.pop(context);
        },
        needsProfileButton: true,
      ),
      body: SafeArea(child: CarWashPackageSwiper()),
    );
  }
}

class CarWashPackageSwiper extends StatelessWidget {
  final List<String> packageNameList = [
    'Diamond',
    'Sapphire',
    'Ruby',
    'Emerald',
  ];

  final List<Text> packageList = [
    kDiamondPackageDetails,
    kSapphirePackageDetails,
    kRubyPackageDetails,
    kEmeraldPackageDetails,
  ];

  final List<TextStyle> packageTextStyleList = [
    kDiamondTextStyle,
    kSapphireTextStyle,
    kRubyTextStyle,
    kEmeraldTextStyle,
  ];
  @override
  Widget build(BuildContext context) {
    return Swiper(
      onTap: (int index) {
        print(index);
      },
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ECCCBlueAccent.withOpacity(.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomPaint(
                    painter: Wave(),
                    child: Container(
                      width: 100.0,
                      height: 120.0,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CarWashPackage(
                              packageTitle: packageNameList[index],
                              packageTitleStyle: packageTextStyleList[index],
                              packageDetails: packageList[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: 4,
      loop: false,
      outer: true,
      pagination: new SwiperPagination(
        margin: EdgeInsets.all(10),
      ),
      control: null,
    );
  }
}
