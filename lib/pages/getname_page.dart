import 'package:flutter/material.dart';
import 'package:project1_bmi_calculator/constants/constants.dart';
import 'package:project1_bmi_calculator/controller/add_data.dart';
import 'package:project1_bmi_calculator/controller/calculator.dart';
import 'package:project1_bmi_calculator/pages/input_page.dart';


class GetName extends StatefulWidget {


  @override
  State<GetName> createState() => _GetNameState();
}

class _GetNameState extends State<GetName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
            TextField (
            decoration: InputDecoration(
            border: InputBorder.none,
                labelText: "Who's BMI?",
            ),
              onChanged: (value){
                setState(() {
                  nameofBMI=value;
                });
              },
          ),
          ElevatedButton(
              onPressed: (){
                print(nameofBMI);
                print(resultText);
                print(bmiResult); // value

                print(interpretation);
                print(age);
                addData(heightOfperson,(systemChoice==1)?weightkg:weightpounds,nameofBMI,resultText, bmiResult,interpretation, age, context, null);
              },
              child:Text("Save")
          ),
            ],
          ),
        ),
      ),
    );
  }
}
