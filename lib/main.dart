import 'package:flutter/material.dart';
import 'screen/InputPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff0A0E21),
      ),
      //  primaryColor:Color(0xff0A0E21) ,
        scaffoldBackgroundColor: const Color(0xff0A0E21),

      ),
      home: InputPage(),
    );
  }
}

