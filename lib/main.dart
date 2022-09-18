import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xioamiode2code/screens/GateKeeper.dart';
import 'package:xioamiode2code/screens/LoginScreen.dart';
import 'package:xioamiode2code/screens/MainScreen.dart';
import 'package:xioamiode2code/screens/OnBoardingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Billing App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.notoSans().fontFamily),
      home: GateKeeper(),
    );
  }
}
