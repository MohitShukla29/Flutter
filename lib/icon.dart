import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';
class Iconwidget extends StatelessWidget {
  const Iconwidget({ required this.icon,required this.label});

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLlabelTextstyle,
        )
      ],
    );
  }
}