import 'package:flutter/material.dart';
import 'package:project1_bmi_calculator/pages/input_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1_bmi_calculator/controller/calculator.dart';
import 'package:project1_bmi_calculator/pages/result_page.dart';
import 'package:project1_bmi_calculator/widgets/bottombutton.dart';
import 'package:project1_bmi_calculator/widgets/bottomtile.dart';
import 'package:project1_bmi_calculator/widgets/container_tile.dart';
import 'package:project1_bmi_calculator/widgets/metric_height.dart';
import 'package:project1_bmi_calculator/widgets/toptile.dart';
import 'package:project1_bmi_calculator/widgets/us_height.dart';
import '../constants/constants.dart';


class InputPageData extends StatefulWidget {

  @override
  State<InputPageData> createState() => _InputPageDataState();
}

class _InputPageDataState extends State<InputPageData> {

  void _calculateButton(){
    setState(() {
      if(systemChoice==2) {
        heightOfperson =
            (double.parse(feet) + (double.parse(inches) * (1 / 12))) * 30.48;
        weightOfperson = weightkg*0.4535924;
      }
      else{
        heightOfperson = currentSliderValue.toDouble();
        weightOfperson = weightkg;
      }
      Calculator brain = Calculator(height: heightOfperson,weight: weightOfperson);
      bmiResult=brain.calculateBMI();
      resultText = brain.getResult();
      interpretation = brain.getInterpretation();
    });

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ResultPage();
    }));
  }
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        //1st expanded
        Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        systemChoice=1;
                        maleInactiveColor = activeColor;
                        femaleInactiveColor = inactiveColor;
                      });
                    },
                    child: Tile(
                      colour:maleInactiveColor,
                      content: TopTile(text: "Metric Units",icon: FontAwesomeIcons.calculator,),
                    ),
                  )
                  ,
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        systemChoice=2;
                        femaleInactiveColor = activeColor;
                        maleInactiveColor = inactiveColor;
                      });
                    },
                    child: Tile(
                      content: TopTile(text: "US Units",icon:FontAwesomeIcons.calculator),
                      colour: femaleInactiveColor,
                    ),
                  ),
                ),
              ],
            )),

        // 2nd expanded
        Tile(
          content: Column(
            children: [
              SizedBox(height: 10,),
              Text(
                "Height",
                style: TextStyle(
                    fontSize: (width/13),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3),
              ),
              (systemChoice==1)?MetricHeight():
              UsHeight(),


            ],
          ),
          colour: Color(0xFF1C1C2D),
        ),

        //3rd expanded
        Expanded  (
          flex: 4,
          child: Row(
            children: [
              (systemChoice==1)?BottomTile(parameter:"kg",text: "Weight",plusCondition: 200,minusCondition: 10,heroTag1: "btn1",heroTag2: "btn2",unit: "(Kg)",):
              BottomTile(parameter:"pounds",text: "Weight",plusCondition: 440,minusCondition: 22,heroTag1: "btn1",heroTag2: "btn2",unit: "(Pounds)",),
              BottomTile(parameter:"age",text:"Age",plusCondition:110,minusCondition: 5,heroTag1: "btn3",heroTag2: "btn4",unit: "(Years)",),
            ],
          ),
        ),

        //4th expanded
        BottomButton(flex: 2, function: _calculateButton, text: "Calculate"),
      ],
    );
  }
}
