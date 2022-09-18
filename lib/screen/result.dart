import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:bmi_calculator/component/reusable_card.dart';
import 'package:bmi_calculator/component/bottom_button.dart';

class ResultPage extends StatelessWidget {
  String bmiResult;
  String resultText;
  String interpretation;

  ResultPage(this.bmiResult, this.resultText, this.interpretation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            child: const Text(
              'Your Result',
              style: titleTextStyle,
            ),
          )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                  activeCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText,
                        style: resultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: titleTextStyle,
                      ),
                      Text(
                        interpretation,
                        style: buttonTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  () {})),
          BottomButton('Re-Calculate', () {
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
