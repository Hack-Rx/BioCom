import 'dart:math';
import 'dart:io';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final double height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / (height * 0.3048 * height * 0.3048);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 18.5) {
      return 'Underweight';
    } else if (_bmi >= 18.5 && _bmi < 25.0) {
      return 'Normal';
    } else if (_bmi >= 25.0 && _bmi < 30.0) {
      return 'Overweight';
    } else if (_bmi >= 30.0 && _bmi < 35.0) {
      return 'Obese Class I';
    } else if (_bmi >= 35.0 && _bmi < 40.0) {
      return 'Obese Class II';
    } else {
      return 'Obese Class III';
    }
  }

  String getInterpretation() {
    if (_bmi < 18.5) {
      return 'A BMI of less than 18.5 is regarded as Underweight and may indicate malnutrition, an eating disorder, or other health problems.';
    } else if (_bmi >= 18.5 && _bmi < 25.0) {
      return 'Your BMI suggests that you have a normal or healthy weight for your height. It’s obviously advisable to try and maintain this and by doing so you may lower your risk of developing serious health conditions.';
    } else if (_bmi >= 25.0 && _bmi < 30.0) {
      return 'Weight that is higher than what is considered as healthy for a given height is described as overweight. You should probably start eating healthy now.';
    } else if (_bmi >= 30.0 && _bmi < 35.0) {
      return 'A BMI of 30 or above is categorised as obese and indicates that you are heavily overweight. It’s recommended that you speak with your doctor as your health may be at risk if you do not lose weight.';
    } else if (_bmi >= 35.0 && _bmi < 40.0) {
      return 'A BMI of 30 or above is categorised as obese and indicates that you are heavily overweight. It’s recommended that you speak with your doctor as your health may be at risk if you do not lose weight.';
    } else {
      return 'A BMI of 30 or above is categorised as obese and indicates that you are heavily overweight. It’s recommended that you speak with your doctor as your health may be at risk if you do not lose weight.';
    }
  }
}
