import 'package:bmi_flutter_app/components/reusebleCard.dart';
import 'package:flutter/material.dart';
import 'package:bmi_flutter_app/constants/constants.dart';
import 'package:bmi_flutter_app/components/backGroundContainer.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.selectedGender,
      @required this.bmiIndex,
      @required this.result,
      @required this.interpretation});

  final int selectedGender;

  final String bmiIndex;
  final String result;
  final String interpretation;

  Color BMIcolor(result) {
    if (result == 'Underweight') {
      return Colors.amber;
    } else if (result == 'Normal') {
      return Colors.lightGreenAccent.shade200;
    } else if (result == 'Overweight') {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kActiveTextColor, //change your color here
        ),
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
      body: BackgroundContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ReusebleCard(
                color: selectedGender == 2
                    ? kActiveFemaleColorList
                    : kActiveMaleColorList,
                borderColor:
                    selectedGender == 1 ? Color(0xFF17D7F7) : Color(0xFFFF4F2D),
                children: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bmiIndex,
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: BMIcolor(result)),
                    ),
                    Text(
                      result,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusebleCard(
                children: Center(
                  child: Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: kActiveTextColor,
                    ),
                  ),
                ),
                color: kInactiveGenderColor,
                borderColor: kBackgroundColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text(
                    'Recalculate',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: selectedGender == 2
                        ? kActiveFemaleColorList
                        : kActiveMaleColorList,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
