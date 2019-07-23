import 'package:flutter/material.dart';

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

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
                onPressed: () {
                  print('Left button pressed.');
                },
                child: Image.asset('images/dice1.png')),
          ),
          Expanded(
            child: FlatButton(
                onPressed: () {
                  print('Right button pressed.');
                },
                child: Image.asset('images/dice1.png')),
          ),
        ],
      ),
    );
  }
}
