
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class iconContent extends StatelessWidget {
  final IconData gender;
  final String text;
  iconContent({required this.gender,required this.text});
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          gender,
          size: 80.0,
        ),
        SizedBox(height: 15),
        Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        )
      ],
    );
  }
}


Widget buildValueCard({
  required String label,
  required int value,
  required VoidCallback onIncrement,
  required VoidCallback onDecrement,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        label,
        style: const TextStyle(fontSize: 20),
      ),
      Text(
        "$value",
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: onIncrement,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              shape: const CircleBorder(),
              backgroundColor: const Color(0x6A6F73),
            ),
            child: const Icon(
              FontAwesomeIcons.plus,
              color: Colors.white,
              size: 50,
            ),
          ),
          ElevatedButton(
            onPressed: onDecrement,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              shape: const CircleBorder(),
              backgroundColor: const Color(0x6A6F73),
            ),
            child: const Icon(
              FontAwesomeIcons.minus,
              color: Colors.white,
              size: 50,
            ),
          ),
        ],
      ),
    ],
  );
}