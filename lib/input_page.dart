import 'package:bmi_calculator/reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const containerColor = Color(0xFF1D1E33);
const inactiveColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double currentHeight = 35.0;
  int weight = 0;
  int age = 0;
  Color maleCardColor = inactiveColor;
  Color femaleCardColor = inactiveColor;

  genderChoice? selectedGender;



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
                    touchDetect: (){
                      setState(() {
                        selectedGender = genderChoice.MALE;
                      });
                    },
                    colour: selectedGender == genderChoice.MALE ? containerColor : inactiveColor,
                    cardChild: iconContent(
                      gender: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    touchDetect: (){
                      setState(() {
                        selectedGender = genderChoice.FEMALE;
                      });
                    },
                    colour: selectedGender == genderChoice.FEMALE ? containerColor : inactiveColor,
                    cardChild: iconContent(
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
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:  RoundSliderOverlayShape(overlayRadius: 30)
    ),
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
          Container(
            color: bottomContainerColor,
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
enum genderChoice{
  MALE,
  FEMALE,
}
