import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:o3_cards/pages/dashboard/dashboard.dart';
import 'pages/splashscreenscreen1/splashscreenscreen1.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ApplicationName',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // routes:{
      //   '/dashboard':(context)=> const Dashboard(),
      // },
      // debugShowCheckedModeBanner: false,
      home: const Splashscreenscreen1(),
    );
  }
}
