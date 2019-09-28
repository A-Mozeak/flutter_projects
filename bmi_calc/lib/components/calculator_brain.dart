import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({@required this.height, @required this.weight});

  final int height;
  final int weight;
  
  double _bmi;

  String calculate() {
    _bmi = (weight/pow(height, 2))*703;
    return _bmi.toStringAsFixed(1);
  }
  
  String getResult() {
    if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi > 18.0) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getStatement() {
    if (_bmi >= 25.0) {
      return 'You have a higher-than-normal BMI, try to work out more and eat cleaner.';
    } else if (_bmi > 18.0) {
      return 'You have a normal BMI, keep it up!';
    } else {
      return 'You have a lower-than-normal BMI, try to gain more muscle or healthy fat.';
    }
  }
  
}