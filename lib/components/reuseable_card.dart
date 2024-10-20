
import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.colour, this.cardChild,  this.touchDetect });
  final Color colour;
  final Widget? cardChild;
  final GestureTapCallback? touchDetect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  touchDetect,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        margin: const EdgeInsets.all(15),
        child: cardChild,
      ),
    );
  }
}
