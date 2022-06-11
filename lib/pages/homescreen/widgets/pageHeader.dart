// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Pageheader extends StatefulWidget {
  const Pageheader({Key? key}) : super(key: key);

  @override
  _PageheaderState createState() => _PageheaderState();
}

class _PageheaderState extends State<Pageheader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
   return Container(
     width: widthOfScreen,
     height: heightOfScreen * 0.2,
     decoration: BoxDecoration(
       image: DecorationImage(
         image: AssetImage("assets/splashbg.png"),
         fit: BoxFit.fitHeight,
       )
     ),
     child: Center(
       child: Image.asset("assets/DrugShoppa-1-1.png"),
     ),
   );

  }
}
