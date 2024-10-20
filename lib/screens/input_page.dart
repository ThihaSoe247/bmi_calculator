import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/components/calculate_button.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';

const bottomContainerHeight = 80.0;
const containerColor = Color(0xFF1D1E33);
const inactiveColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);
double currentHeight = 35.0;
int weight = 0;
int age = 0;
Color maleCardColor = inactiveColor;
Color femaleCardColor = inactiveColor;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


  GenderChoice? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Gender Selection Row
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    touchDetect: () {
                      setState(() {
                        selectedGender = GenderChoice.MALE;
                      });
                    },
                    colour: selectedGender == GenderChoice.MALE
                        ? containerColor
                        : inactiveColor,
                    cardChild: const IconContent(
                      gender: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    touchDetect: () {
                      setState(() {
                        selectedGender = GenderChoice.FEMALE;
                      });
                    },
                    colour: selectedGender == GenderChoice.FEMALE
                        ? containerColor
                        : inactiveColor,
                    cardChild: const IconContent(
                      gender: FontAwesomeIcons.venus,
                      text: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Height Slider
          Expanded(
            child: ReusableCard(
              colour: containerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${currentHeight.round()}",
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text("cm"),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: Colors.white,
                        thumbColor: Colors.pink,
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                      value: currentHeight,
                      onChanged: (value) {
                        setState(() {
                          currentHeight = value;
                        });
                      },
                      min: 30.0,
                      max: 250.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Weight and Age Selection Row
          Expanded(
            child: Row(
              children: [
                // Weight Card
                Expanded(
                  child: ReusableCard(
                    colour: containerColor,
                    cardChild: buildValueCard(
                      label: "WEIGHT",
                      value: weight,
                      onIncrement: () {
                        setState(() {
                          weight++;
                        });
                      },
                      onDecrement: () {
                        if (weight > 0) {
                          setState(() {
                            weight--;
                          });
                        }
                      },
                    ),
                  ),
                ),

                // Age Card
                Expanded(
                  child: ReusableCard(
                    colour: containerColor,
                    cardChild: buildValueCard(
                      label: "AGE",
                      value: age,
                      onIncrement: () {
                        setState(() {
                          age++;
                        });
                      },
                      onDecrement: () {
                        if (age > 0) {
                          setState(() {
                            age--;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Container
          CalculateButton(title: "Calculate Your BMI",onTap: (){

            Calculator calc = Calculator(height: currentHeight.round(), weight:  weight);
            final result = calc.calculateBMI();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResultPage(bmiResult: result, resultText: calc.getResult(), interpret: calc.getInterpretation()))
                );

          },),
        ],
      ),
    );
  }
}


enum GenderChoice {
  MALE,
  FEMALE,
}
