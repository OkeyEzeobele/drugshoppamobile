// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:drug_shoppa/pages/homescreen/widgets/banner.dart';
import 'package:drug_shoppa/pages/homescreen/widgets/promos.dart';
import 'package:flutter/material.dart';
import '/../pages/homescreen/widgets/greeting.dart';
import '/../pages/homescreen/widgets/quickLinks.dart';
import '/../ui/export.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: FvColors.edittext51Background,
      body: Column(
        children: [
          Pageheader(),
          Greeting(),
          SizedBox.square(
            dimension: widthOfScreen * 0.07,
          ),
          QuickLinks(),
          SizedBox.square(
            dimension: widthOfScreen * 0.05,
          ),
          Promos(),
          // Activities()
          SizedBox(
            height: heightOfScreen * 0.1,
          ),
          PromoBanner()
        ],
      ),
    );
  }
}
