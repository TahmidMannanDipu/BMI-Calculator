
import 'package:flutter/material.dart';
import 'package:bmi_calculator/input_page.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InputPage(),
      ),
    );
  }
}
