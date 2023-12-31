import 'package:flutter/material.dart';
import 'package:bmi_calculator/result_page.dart';

const kBottomContainerColor = Color(0xFF252526);
const kBottomContainerHeight = 80.0;

class MyHomePage extends StatefulWidget {
  final Function? onPressed;
  MyHomePage({this.onPressed});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color containerColor = kBottomContainerColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animateContainerColor();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        child: Center(
          child: Text(
            'Calculate BMI',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        color: containerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }

  void _animateContainerColor() {
    setState(() {
      containerColor = Colors.red;
    });

    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultPage()),
      );
      setState(() {
        containerColor = kBottomContainerColor;
      });
    });
  }
}
