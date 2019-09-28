import 'package:flutter/material.dart';
import 'package:bmi_calc/constants.dart';


class IconWithText extends StatelessWidget {
  IconWithText({@required this.iconData, this.assocText});

  final IconData iconData;
  final String assocText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          assocText,
          style: kLabelStyle,
        )
      ],
    );
  }
}