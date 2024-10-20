import 'package:bmi_calculator/components/calculate_button.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpret;
  const ResultPage(
      {super.key, required this.bmiResult,
      required this.resultText,
      required this.interpret});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "YOUR RESULT",
                textAlign: TextAlign.center,
                style: TextStyle(

                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: containerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(resultText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 22.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    bmiResult,
                    style: const TextStyle(
                        fontSize: 100,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    interpret,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),

                ],
              ),
            ),
          ),
          CalculateButton(
              title: "Re-Calculate",
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
