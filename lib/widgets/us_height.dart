import 'package:flutter/material.dart';
import 'package:project1_bmi_calculator/constants/constants.dart';
class UsHeight extends StatefulWidget {
  const UsHeight({Key? key}) : super(key: key);

  @override
  _UsHeightState createState() => _UsHeightState();
}

class _UsHeightState extends State<UsHeight> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value){
                setState(() {
                  feet = value;
                  print(feet);
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Feet',
              ),
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: (value){
                setState(() {
                  inches=value;
                  print(inches);
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Inches',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
