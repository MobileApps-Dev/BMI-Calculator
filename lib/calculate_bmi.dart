import 'dart:math';

class CalculateBmi {
  int height;
  int weight;
  double bmi = 0;

  CalculateBmi(this.height, this.weight);

  String calculate() {
    bmi = weight / pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Over Weight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }

  String getInterpetation() {
    if (bmi >= 25) {
      return 'You have a higher than normal body weight';
    } else if (bmi > 18.5) {
      return 'You have normal body weight';
    } else {
      return 'You have a lower than normal body weight';
    }
  }
}
