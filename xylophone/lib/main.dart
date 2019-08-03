import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int pitch) {
    final player = AudioCache();
    player.play('note$pitch.wav');
  }
  Widget buildKey({Color kcolor, int kpitch}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playSound(kpitch);
        },
        color: kcolor,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylo-On-Your-Phone',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(kcolor: Colors.red, kpitch: 1),
              buildKey(kcolor: Colors.orange, kpitch: 2),
              buildKey(kcolor: Colors.yellow, kpitch: 3),
              buildKey(kcolor: Colors.green, kpitch: 4),
              buildKey(kcolor: Colors.blue, kpitch: 5),
              buildKey(kcolor: Colors.indigo, kpitch: 6),
              buildKey(kcolor: Colors.purple, kpitch: 7),
            ],
          ),
        ),
      ),
    );
  }
}
