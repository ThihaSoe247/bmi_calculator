
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String title;
  const CalculateButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onTap,
      child: Container(
        color: bottomContainerColor,
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: bottomContainerHeight,
        child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}