import 'package:bmi_calc/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calc/components/reusable_container.dart';
import 'package:bmi_calc/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.result, @required this.bmi, @required this.statement});

  final String result;
  final String bmi;
  final String statement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text('Your Results', style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              shade: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    result.toUpperCase(),
                    style: kResultTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    bmi,
                    style: kBMITextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    statement,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            interaction: () {
              Navigator.pop(context);
            },
            title: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
