import 'package:bmi_calculator/ui/widgets/bottom_button.dart';
import 'package:bmi_calculator/ui/widgets/single_card.dart';
import 'package:flutter/material.dart';
import '../model/constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {Key? key,
      required this.bmiResult,
      required this.resultText,
      required this.resultInterpretation})
      : super(key: key);

  final String bmiResult;
  final String resultText;
  final String resultInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12.0, 12.0, 0.0, 0.0),
              child: Text(
                'Your Result',
                style: kContentTextStyle,
              ),
            ),
            Expanded(
              child: SingleCard(
                cardColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: kResultDescriptionTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kResultNumberTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        resultInterpretation,
                        style: kResultInterpretationTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              textLabel: 'RE-CALCULATE',
            ),
          ],
        ));
  }
}
