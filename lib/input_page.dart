import 'package:bmi_calculator/animated_button.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constant.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? genderSelected;
  double height = 4.0;
  int weight = 60;
  int age = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: Color(0XFF252526),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      genderSelected = Gender.male;
                    });
                  },
                  child: ReusableCard(
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        level: 'MALE',
                      ),
                      colour: genderSelected == Gender.male
                          ? kActiveCardColor
                          : kCardColor),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      genderSelected = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      level: 'FEMALE',
                    ),
                    colour: genderSelected == Gender.female
                        ? kActiveCardColor
                        : kCardColor,
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLevelTextStyle,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kOtherTextStyle,
                      ),
                      Text(
                        'feet',
                        style: kLevelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        trackHeight: 8.0,
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0, elevation: 6.0)),
                    child: Slider(
                      value: height,
                      min: 4.0,
                      max: 8.0,
                      divisions: 30,
                      inactiveColor: Colors.white,
                      overlayColor: MaterialStateProperty.all(Colors.redAccent),
                      activeColor: Colors.red,
                      onChanged: (double value) {
                        setState(() {
                          height = double.parse((value).toStringAsFixed(1));
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLevelTextStyle,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        weight.toString(),
                        style: kOtherTextStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kCardColor,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLevelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kOtherTextStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ]),
                ),
              )
            ],
          )),
          MyHomePage()
        ],
      ),
    );
  }
}
