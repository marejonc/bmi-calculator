import 'package:bmi_calculator/ui/result_page.dart';
import '../ui/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/icon_content.dart';
import 'widgets/single_card.dart';
import 'widgets/round_icon_button.dart';
import '../model/constants.dart';
import '../model/utilities.dart';
import '../model/calculator.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  kGender _selectedGender = kGender.male;
  int _height = 170;
  int _weight = 60;
  int _age = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: SingleCard(
                    cardColor:
                        _selectedGender == kGender.male ? kActiveCardColor : kInactiveCardColor,
                    cardChild: const IconContent(
                      iconName: FontAwesomeIcons.mars,
                      stringLabel: 'MALE',
                    ),
                    isTop: true,
                    onPress: () {
                      setState(() {
                        _selectedGender = kGender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: SingleCard(
                    cardColor:
                        _selectedGender == kGender.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: const IconContent(
                      iconName: FontAwesomeIcons.venus,
                      stringLabel: 'FEMALE',
                    ),
                    isTop: true,
                    onPress: () {
                      setState(() {
                        _selectedGender = kGender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _height.toString(),
                        style: kContentTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: kBottomPanelColor,
                      overlayColor: kBottomPanelColor.withAlpha(0x29),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kLabelTextColor,
                    ),
                    child: Slider(
                      value: _height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          _height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: SingleCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _weight.toString(),
                          style: kContentTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  _weight = decrementCardValue(_weight);
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  _weight = incrementCardValue(_weight);
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _age.toString(),
                          style: kContentTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  _age = decrementCardValue(_age);
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  _age = incrementCardValue(_age);
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              Calculator calculator = Calculator(_height, _weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calculator.calculateBMI(),
                    resultText: calculator.getResult(),
                    resultInterpretation: calculator.getInterpretation(),
                  ),
                ),
              );
            },
            textLabel: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
