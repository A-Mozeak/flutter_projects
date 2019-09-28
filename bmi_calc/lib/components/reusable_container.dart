import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  ReusableContainer({@required this.shade, this.cardChild, this.interaction});

  final Color shade;
  final Widget cardChild;
  final Function interaction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: interaction,
        child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardChild,
        decoration: BoxDecoration(
          color: shade,
          borderRadius: BorderRadius.circular(10.0),
        ),
        
      ),
    );
  }
}