import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.minPositive,
              ),
              CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('images/smol01Alex.jpg'),
              ),
              Text(
                'Alexander Mozeak',
                style: TextStyle(
                  fontFamily: 'Amaranth',
                  color: Colors.white,
                  fontSize: 35.0,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  color: Colors.teal[200],
                  fontSize: 15.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                elevation: 4.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '(347) 551-4252',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      color: Colors.teal,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Card(
                elevation: 4.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'alex@astar.app',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      color: Colors.teal,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
