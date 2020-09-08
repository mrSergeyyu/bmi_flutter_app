import 'package:flutter/material.dart';
import 'package:bmi_flutter_app/constants/constants.dart';
import 'pages/firstPage.dart';

void main() {
  runApp(BMIApp());
}

class BMIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FistScreen(),
    );
  }
}

class FistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        centerTitle: false,
        title: Text(
          'BMI Calculator',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            color: kActiveTextColor,
          ),
        ),
      ),
      body: FirstPage(),
    );
  }
}
