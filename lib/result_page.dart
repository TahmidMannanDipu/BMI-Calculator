import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: Color(0XFF252526),
      ),
      body: Text(
        'Hello'
      ),
    );
  }
}
