// ignore_for_file: file_names, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '/../services/shared_service.dart';
import '/../ui/pallete.dart';

class Greeting extends StatefulWidget {
  const Greeting({Key? key}) : super(key: key);

  @override
  _GreetingState createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  @override
  void initState() {
    super.initState();
  }

  // ignore: unused_field
  String _firstname = '';
  _GreetingState() {
    getTextFromFile().then(
      (val) => setState(() {
        _firstname = val;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: EdgeInsets.only(left: widthOfScreen * 0.05),
              child: Icon(
                Icons.circle,
                size: 10,
                color: Colors.redAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Your Store: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14.0,
                      color: FvColors.maintheme,
                    ),
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Elfimo Canal West Mall Osapa, Lekki',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: FvColors.maintheme,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox.square(
          dimension: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox.square(
              dimension: 50,
              child: Image.asset('assets/boy.png'),
            ),
            SizedBox(
              width: widthOfScreen * 0.25,
              child: AutoSizeText.rich(
                TextSpan(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Hello,',
                      style: TextStyle(
                          fontSize: 15,
                          color: FvColors.textview50FontColor,
                          fontWeight: FontWeight.w700),
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <TextSpan>[
                        TextSpan(
                          // text: _firstname,
                          text: 'Linez',
                          style: TextStyle(
                              fontSize: 15,
                              color: FvColors.textview50FontColor,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
                minFontSize: 10,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: widthOfScreen * 0.4
            ),
            GestureDetector(
              child: CircleAvatar(
                radius: heightOfScreen * 0.03,
                backgroundColor: FvColors.textview79FontColor,
                child: SizedBox.square(
                  dimension: heightOfScreen * 0.025,
                  child: Image.asset('assets/bell.png'),
                ),
              ),
              onTap: () {
                SharedService.logout(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  Future<String> getTextFromFile() async {
    var userDetails = await SharedService.loginDetails();
    var name = userDetails!.payload!.user!.fullName;
    return name.substring(0, name.indexOf(' '));
  }
}
