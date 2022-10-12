// ignore_for_file: file_names, prefer_const_constructors,  prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import '/../ui/pallete.dart';

class PromoBanner extends StatefulWidget {
  const PromoBanner({Key? key}) : super(key: key);

  @override
  _PromoBannerState createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
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
    return SizedBox(
      height: heightOfScreen * 0.15,
      width: widthOfScreen,
      child: Container(
        color: FvColors.maintheme,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'NEED',
                  style: TextStyle(
                    color: FvColors.edittext51Background,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Routine',
                  style: TextStyle(
                    color: FvColors.edittext51Background,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Medication?',
                  style: TextStyle(
                    color: FvColors.edittext51Background,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: widthOfScreen * 0.2,
              height: heightOfScreen * 0.08,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(
                  'assets/pills.png',
                ),
              ),
            ),
            SizedBox(
              height: heightOfScreen * 0.06,
              width: widthOfScreen * 0.4,
              child: TextButton(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: const Text(
                    'Refill Now',
                    style: TextStyle(
                      color: FvColors.maintheme,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: FvColors.edittext51Background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      width: 1,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
