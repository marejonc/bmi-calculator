import 'package:flutter/material.dart';
import 'input_page.dart';
import 'result_page.dart';
import '../model/constants.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InputPage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: kMainColor,
        scaffoldBackgroundColor: kMainColor,
      ),
    );
  }
}
