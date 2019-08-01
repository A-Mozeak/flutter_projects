import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Magic 8 Ball'),
            ),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.blueGrey,
          body: MagicBall(),
        ),
      ),
    );

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballState = 1;

  void shakeTheMagicBall() {
    setState(() {
      ballState = Random().nextInt(5) + 1;
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
                shakeTheMagicBall();
              },
              child: Image.asset('images/ball$ballState.png'),
            ),
          ),
        ],
      ),
    );
  }
}
