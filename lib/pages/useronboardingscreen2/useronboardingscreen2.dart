// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../signup/signupscreen.dart';
import '/ui/export.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Useronboardingscreen2 extends StatefulWidget {
  const Useronboardingscreen2({Key? key}) : super(key: key);

  @override
  _Useronboardingscreen2State createState() => _Useronboardingscreen2State();
}

class _Useronboardingscreen2State extends State<Useronboardingscreen2> {
  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        width: widthOfScreen,
        height: heightOfScreen + 24,
        // decoration: BoxDecoration(
        //     image: const DecorationImage(
        //   image: AssetImage("assets/onboardbgrd.png"),
        //   fit: BoxFit.cover,
        // )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
              ),
              child: SizedBox(
                width: widthOfScreen * 0.8,
                height: heightOfScreen * 0.7,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: RichText(
                      text: TextSpan(
                        text: 'Welcome\n\n',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                '“Drugshopper” is a customer-centric platform providing convenient pharmaceutical services to individuals who wish for a seamless customer journey.  We are supported by Elfimo Pharmacy, A leading wholesale pharmacy in Nigeria. Through Elfimo, we are able to leverage on a network of pharmaceutical reps and manufacturers to obtain fair prices.\n\n',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: 'OUR SERVICES\n\n',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: FvColors.maintheme,
                                fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: 'Health Services & Supply\n',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: FvColors.maintheme,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text:
                                'We offer delivery and pick up services for medication,devices and personal care items. We also facilitate periodic health screenings at Elfimo locations in Lekki. ',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text:
                                'To order prescription drugs,obtain a unique 4 digit code from the on-call pharmacist and hit the PAY button\n\n',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: FvColors.maintheme),
                          ),
                          TextSpan(
                            text: 'Free Consultation\n',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: FvColors.maintheme,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text:
                                'We have a team of pharmacists available to assist you in selecting the right medication or brand who are available via Whatsapp or phone call.\n\n',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Prescription Management\n',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: FvColors.maintheme,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text:
                                'Through our VIP service (recommended for diabetics, hypertensives and others needing routine medication), we cater to individuals who need periodic refills. We work with you to make sure you never miss a dose',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heightOfScreen * 0.05,
            ),
            SizedBox(
              height: heightOfScreen * 0.06,
              width: widthOfScreen * 0.4,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    animationDuration: Duration(milliseconds: 100),
                    backgroundColor: FvColors.maintheme,
                    elevation: 10),
                icon: FaIcon(
                  FontAwesomeIcons.doorOpen,
                  color: FvColors.offwhite,
                ),
                label: Text(
                  'Enter',
                  style: TextStyle(color: FvColors.offwhite),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: FvColors.maintheme,
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    builder: (context) {
                      return SizedBox(
                        height: heightOfScreen * 0.25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: widthOfScreen * 0.01,
                                        top: heightOfScreen * 0.05),
                                    child: SizedBox(
                                      height: heightOfScreen * 0.07,
                                      width: widthOfScreen * 0.7,
                                      child: TextButton(
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: const Text(
                                            'Register',
                                            style: TextStyle(
                                              color: FvColors.maintheme,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          backgroundColor: FvColors.offwhite,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                16.31081199645996),
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
                                              builder: (context) =>
                                                  const Signupscreen(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: widthOfScreen * 0.01,
                                        top: heightOfScreen * 0.015),
                                    child: SizedBox(
                                      height: heightOfScreen * 0.07,
                                      width: widthOfScreen * 0.7,
                                      child: TextButton(
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: const Text(
                                            'Sign In',
                                            style: TextStyle(
                                              color: FvColors.maintheme,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                16.31081199645996),
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
                                              builder: (context) =>
                                                  const Loginscreen(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
