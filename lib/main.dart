import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: Color(0xFF111539)),
        scaffoldBackgroundColor: const Color(0xFF111539),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.red, // Applies the theme color to FAB globally
        ),
      ),
      home: InputPage(),
    );
  }
}
