import 'package:flutter/material.dart';
import 'package:bmi_calc/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({@required this.interaction, @required this.title});

  final Function interaction;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: interaction,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: kLargeButtonTextStyle,
            ),
          ],
        ),
        color: kPinkAccent,
        margin: EdgeInsets.only(top: 10.0),
        height: 80.0,
        width: double.infinity,
      ),
    );
  }
}