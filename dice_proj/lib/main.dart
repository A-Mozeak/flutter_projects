import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: Text('Dice Roller'),
            backgroundColor: Colors.red,
          ),
          body: DicePage(),
        ),
      ),
);

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceImage = 1;
  int rightDiceImage = 1;
  void rollDice(){
    setState(() {
      leftDiceImage = Random().nextInt(6) + 1;
      rightDiceImage = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
                onPressed: () {
                  rollDice();
                },
                child: Image.asset('images/dice$leftDiceImage.png')),
          ),
          Expanded(
            child: FlatButton(
                onPressed: () {
                  rollDice();
                },
                child: Image.asset('images/dice$rightDiceImage.png')),
          ),
        ],
      ),
    );
  }
}
