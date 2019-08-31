import 'package:flutter/material.dart';
import 'reusable_container.dart';
import 'icon_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);
const Color pinkAccent = Color(0xFFEB1555);

enum Genders {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  Genders selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Expanded>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Genders.male;
                      });
                    },
                    child: ReusableContainer(
                      shade: selectedGender == Genders.male ? activeCardColor : inactiveCardColor,
                      cardChild: IconWithText(
                        iconData: FontAwesomeIcons.mars,
                        assocText: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Genders.female;
                      });
                    },
                    child: ReusableContainer(
                      shade: selectedGender == Genders.female ? activeCardColor : inactiveCardColor,
                      cardChild: IconWithText(
                        iconData: FontAwesomeIcons.venus,
                        assocText: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableContainer(shade: activeCardColor),
          ),
          Expanded(
            child: Row(
              children: <Expanded>[
                Expanded(
                  child: ReusableContainer(shade: activeCardColor),
                ),
                Expanded(
                  child: ReusableContainer(shade: activeCardColor),
                ),
              ],
            ),
          ),
          Container(
            color: pinkAccent,
            margin: EdgeInsets.only(top: 10.0),
            height: 80.0,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
