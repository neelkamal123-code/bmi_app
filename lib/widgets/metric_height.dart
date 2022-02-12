import 'package:flutter/material.dart';
import 'package:project1_bmi_calculator/constants/constants.dart';

class MetricHeight extends StatefulWidget {

  @override
  State<MetricHeight> createState() => _MetricHeightState();
}

class _MetricHeightState extends State<MetricHeight> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentSliderValue.toString(),
              style: TextStyle(fontSize: width/16, letterSpacing: 3),
            ),
            Text(
              "cm",
              style: TextStyle(fontSize: (width/10)*0.5, letterSpacing: 3),
            ),
          ],
        ),
        Slider(
          activeColor: Colors.pink,
          inactiveColor: Colors.grey,
          value: currentSliderValue.toDouble(),
          min: 90.0,
          max: 220.0,
          divisions: 100,
          label: currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              currentSliderValue = value.toInt();
            });
          },
        ),
      ],
    );
  }
}
