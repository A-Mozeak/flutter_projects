import 'package:flutter/material.dart';

class RoundButtonThing extends StatelessWidget {
  RoundButtonThing({this.icon, this.interaction});

  final IconData icon;
  final Function interaction;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      textStyle: TextStyle(color: Colors.white),
      elevation: 6.0,
      onPressed: interaction,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF8D8E98),
      shape: CircleBorder(),
    );
  }
}
