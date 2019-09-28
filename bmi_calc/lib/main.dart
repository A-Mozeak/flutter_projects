import 'package:flutter/material.dart';
import 'package:bmi_calc/screens/input_page.dart';
import 'package:bmi_calc/screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF0A0E21),
          accentColor: Colors.purple,
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          textTheme: TextTheme(
            body1: TextStyle(
              color: Colors.white,
            ),
            body2: TextStyle(
              color: Colors.white,
            ),
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
      },
    );
  }
}


