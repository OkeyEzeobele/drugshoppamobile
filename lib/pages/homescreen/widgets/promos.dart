// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import '/../ui/pallete.dart';

class Promos extends StatefulWidget {
  const Promos({Key? key}) : super(key: key);

  @override
  _PromosState createState() => _PromosState();
}

class _PromosState extends State<Promos> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    // debugPrint('Screen Height: $heightOfScreen');
    // debugPrint('Screen Width: $widthOfScreen');
    return Container(
      color: FvColors.maintheme,
      width: widthOfScreen,
      height: heightOfScreen * 0.2,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.truckMedical,
              size: heightOfScreen * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
