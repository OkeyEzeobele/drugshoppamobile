import 'package:flutter/material.dart';
import '../../ui/export.dart';

class Splashscreenscreen1 extends StatefulWidget {
  const Splashscreenscreen1({Key? key}) : super(key: key);

  @override
  _Splashscreenscreen1State createState() => _Splashscreenscreen1State();
}

class _Splashscreenscreen1State extends State<Splashscreenscreen1> {
  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: FvColors.offwhite,
      body: Container(
        width: widthOfScreen,
        height: heightOfScreen,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/splashbgportrait.png"),
              fit: BoxFit.fitHeight),
        ),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: heightOfScreen * 0.3),
                child: SizedBox(
                  height: heightOfScreen * 0.25,
                  width: widthOfScreen * 0.9,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset("assets/DrugShoppa-1-1.png"),
                  ),
                ),
              ),
              SizedBox(
                height: heightOfScreen * 0.35,
              ),
              SizedBox(
                height: heightOfScreen * 0.06,
                width: widthOfScreen * 0.4,
                child: TextButton(
                  // ignore: prefer_const_constructors
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: FvColors.offwhite,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: FvColors.maintheme,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Useronboardingscreen2(),
                      ),
                    );
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
