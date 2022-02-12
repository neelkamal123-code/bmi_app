import 'dart:math';
class Calculator {
  Calculator({required this.height, required this.weight});

  final double height;
  final double weight;
  double bmi = 0;

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi > 29.9) {
      return "Obese";
    }
    else if (bmi > 24.9) {
      return "Overweight";
    }
    else if (bmi >= 18.5) {
      return "Normal";
    }
    else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    String result = getResult();
    if (result == "Obese") {
      return "You have a very higher than normal body weight. Follow vigorous workout plan.";
    }
    else if (result == "Overweight") {
      return "You have a higher than normal body weight. Try to exercise more.";
    }
    else if (result == "Normal") {
      return "You have a normal body weight. Good job";
    }
    else {
      return "You have a lower than normal body weight. You can eat a bit more";
    }
  }
}