import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/component/icon_content.dart';
import 'package:bmi_calculator/component/reusable_card.dart';
import '../constants.dart';
import 'result.dart';
import 'package:bmi_calculator/component/bottom_button.dart';
import 'package:bmi_calculator/component/calculate_bmi.dart';

enum Gender { none, male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  selectedGender == Gender.male
                      ? activeCardColor
                      : inActiveCardColor,
                  IconContent(FontAwesomeIcons.mars, 'Male'),
                  () {
                    setState(() {
                      selectedGender == Gender.male;
                    });
                  },
                )),
                Expanded(
                    child: ReusableCard(
                  selectedGender == Gender.female
                      ? activeCardColor
                      : inActiveCardColor,
                  IconContent(FontAwesomeIcons.venus, 'FeMale'),
                  () {
                    setState(() {
                      selectedGender == Gender.female;
                    });
                  },
                )),
              ],
            )),
            Expanded(
                child: ReusableCard(
                    activeCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Height',
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: numberTextStyle,
                            ),
                            const Text(
                              'cm',
                              style: labelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor: Color(0xFF8D8E98),
                                activeTrackColor: Colors.white,
                                thumbColor: Color(0xFFEB1555),
                                overlayColor: Color(0x29EB1555),
                                thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: const RoundSliderOverlayShape(
                                    overlayRadius: 30.0)),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });

                                print(newValue);
                              },
                            ))
                      ],
                    ),
                    () {})),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                        Color(0xFF1D1E33),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Weight',
                              style: labelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: numberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                              ],
                            )
                          ],
                        ),
                        () {})),
                Expanded(
                    child: ReusableCard(
                        Color(0xFF1D1E33),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Age',
                              style: labelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: numberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                              ],
                            )
                          ],
                        ),
                        () {})),
              ],
            )),
            BottomButton('Calculator', () {
              CalculateBmi calculateBmi = CalculateBmi(height, weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                          calculateBmi.calculate(),
                          calculateBmi.getResult(),
                          calculateBmi.getInterpetation())));
            })
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  RoundIconButton(this.icon, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6,
      constraints: const BoxConstraints.tightFor(width: 56, height: 56),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
