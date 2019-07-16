import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.teal[200],
          title: Text("Alexander Mozeak"),
          centerTitle: true,
          ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Text("Thanks for checking out my business card!"),
            height: 200.0,
            width: 200.0,
            padding: EdgeInsets.all(20.0),
          ),
        ), 
      ),
    );
  }
}
