import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {@required this.colour,
      this.cardChild,
      this.paddingLeft,
      this.paddingBottom,
      this.paddingRight,
      this.paddingTop});

  final Color colour;
  final Widget cardChild;
  final double paddingLeft;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 145,
        child: cardChild,
        margin: EdgeInsets.fromLTRB(
            paddingLeft, paddingTop, paddingRight, paddingBottom),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
