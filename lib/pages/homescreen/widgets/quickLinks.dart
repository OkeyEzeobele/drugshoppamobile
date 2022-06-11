// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '/../ui/pallete.dart';

class QuickLinks extends StatefulWidget {
  const QuickLinks({Key? key}) : super(key: key);

  @override
  _QuickLinksState createState() => _QuickLinksState();
}

class _QuickLinksState extends State<QuickLinks> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              shadowColor: Colors.grey.shade50,
              color: FvColors.textview88FontColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: heightOfScreen * 0.09,
                width: widthOfScreen * 0.6,
                child: Row(
                  children: [
                    SizedBox.square(
                      dimension: heightOfScreen * 0.06,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image(
                          image: AssetImage('assets/whatsapp.png'),
                        ),
                      ),
                    ),
                    SizedBox.square(
                      dimension: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'CHAT\n',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'On-Call Pharmacist',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              shadowColor: Colors.grey.shade50,
              color: FvColors.textview88FontColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: heightOfScreen * 0.09,
                width: widthOfScreen * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox.square(
                      dimension: heightOfScreen * 0.06,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image(
                          image: AssetImage('assets/phone-call.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
