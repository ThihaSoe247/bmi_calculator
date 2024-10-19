
import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, this.cardChild,  this.touchDetect });
  final Color colour;
  final Widget? cardChild;
  final GestureTapCallback? touchDetect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  touchDetect,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        margin: const EdgeInsets.all(15),
      ),
    );
  }
}
