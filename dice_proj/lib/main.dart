import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: Text('Dice Roller'),
          ),
          body: DicePage(),
        ),
      ),
    );

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Row(children: <Widget>[],);
  }
}