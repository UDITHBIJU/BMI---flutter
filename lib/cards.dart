import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  Cards({@required this.colour, this.cardChild, this.onPress});
  final Color? colour;
  final Widget? cardChild;
  final onPress; //this is a function

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          child: cardChild,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
