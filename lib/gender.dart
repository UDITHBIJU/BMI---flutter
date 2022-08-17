import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  Gender({@required this.icon, @required this.sex});
  final IconData? icon;
  final  sex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          sex,
          style: const TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}