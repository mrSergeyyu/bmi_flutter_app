import 'package:bmi_flutter_app/components/bmiBrain.dart';
import 'package:bmi_flutter_app/pages/resultPage.dart';
import 'package:flutter/material.dart';
import 'package:bmi_flutter_app/constants/constants.dart';
import 'package:bmi_flutter_app/components/reusebleCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_flutter_app/components/backGroundContainer.dart';
import 'package:bmi_flutter_app/components/bmiBrain.dart';

enum Gender {
  male,
  female,
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 22;
  int finalGender;

  Color activeColorGenderDependencies(Gender gender) {
    if (selectedGender == Gender.male) {
      return kActiveMaleColor;
    }
    if (selectedGender == Gender.female) {
      return kActiveFemaleColor;
    } else {
      return kInactiveTextColor;
    }
  }

  Color sliderColorGenderDependencies(Gender gender) {
    if (selectedGender == Gender.male) {
      return Color(0xFFD6FDFC);
    }
    if (selectedGender == Gender.female) {
      return Color(0xFFFCDFC0);
    } else {
      return kInactiveTextColor;
    }
  }

  List<Color> buttomButtonColors(Gender gender) {
    if (selectedGender == Gender.male) {
      return kActiveMaleColorList;
    }
    if (selectedGender == Gender.female) {
      return kActiveFemaleColorList;
    } else {
      return kInactiveGenderColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackgroundContainer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ReusebleCard(
                    color: selectedGender == Gender.male
                        ? kActiveMaleColorList
                        : kInactiveGenderColor,
                    children: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                          color: selectedGender == Gender.male
                              ? Colors.white
                              : kInactiveTextColor,
                        ),
                        Text(
                          'Male',
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedGender == Gender.male
                                ? Colors.white
                                : kInactiveTextColor,
                          ),
                        ),
                      ],
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    borderColor: selectedGender == Gender.male
                        ? Color(0xFF17D7F7)
                        : kBackgroundColor,
                  ),
                ),
                Expanded(
                  child: ReusebleCard(
                    color: selectedGender == Gender.female
                        ? kActiveFemaleColorList
                        : kInactiveGenderColor,
                    children: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                          color: selectedGender == Gender.female
                              ? Colors.white
                              : kInactiveTextColor,
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedGender == Gender.female
                                ? Colors.white
                                : kInactiveTextColor,
                          ),
                        ),
                      ],
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    borderColor: selectedGender == Gender.female
                        ? Color(0xFFFF4F2D)
                        : kBackgroundColor,
                  ),
                ),
              ],
            ),
            Text(
              'Height',
              style: TextStyle(fontSize: 18, color: kActiveTextColor),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toString(),
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: activeColorGenderDependencies(selectedGender),
                  ),
                ),
                Text(
                  'cm',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: activeColorGenderDependencies(selectedGender),
                  ),
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 1,
                activeTrackColor: activeColorGenderDependencies(selectedGender),
                inactiveTrackColor:
                    sliderColorGenderDependencies(selectedGender),
                thumbColor: activeColorGenderDependencies(selectedGender),
                overlayColor: sliderColorGenderDependencies(selectedGender),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 18),
              ),
              child: Slider(
                min: 150,
                max: 220,
                value: height.toDouble(),
                onChanged: (double newValue) {
                  setState(() {
                    height = newValue.toInt();
                  });
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ReusebleCard(
                    color: kInactiveGenderColor,
                    borderColor: kBackgroundColor,
                    children: Column(
                      children: [
                        Text(
                          'Weight',
                          style:
                              TextStyle(fontSize: 18, color: kActiveTextColor),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color:
                                activeColorGenderDependencies(selectedGender),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RawMaterialButton(
                                shape: CircleBorder(),
                                fillColor: Colors.white,
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: kActiveTextColor,
                                ),
                                constraints: BoxConstraints.tightFor(
                                  width: 60,
                                  height: 60,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                elevation: 0,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: RawMaterialButton(
                                elevation: 0,
                                shape: CircleBorder(),
                                fillColor: Colors.white,
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: kActiveTextColor,
                                ),
                                constraints: BoxConstraints.tightFor(
                                  width: 60,
                                  height: 60,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusebleCard(
                    color: kInactiveGenderColor,
                    borderColor: kBackgroundColor,
                    children: Column(
                      children: [
                        Text(
                          'Age',
                          style:
                              TextStyle(fontSize: 18, color: kActiveTextColor),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color:
                                activeColorGenderDependencies(selectedGender),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RawMaterialButton(
                                shape: CircleBorder(),
                                fillColor: Colors.white,
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: kActiveTextColor,
                                ),
                                constraints: BoxConstraints.tightFor(
                                  width: 60,
                                  height: 60,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                elevation: 0,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: RawMaterialButton(
                                elevation: 0,
                                shape: CircleBorder(),
                                fillColor: Colors.white,
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: kActiveTextColor,
                                ),
                                constraints: BoxConstraints.tightFor(
                                  width: 60,
                                  height: 60,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  BmiBrain calc = BmiBrain(height: height, weight: weight);
                  selectedGender == Gender.male
                      ? finalGender = 1
                      : finalGender = 2;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ResultPage(
                        selectedGender: finalGender,
                        bmiIndex: calc.calculateBMI(),
                        result: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      );
                    }),
                  );
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: buttomButtonColors(selectedGender)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
