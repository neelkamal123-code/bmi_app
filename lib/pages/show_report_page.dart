import 'package:flutter/material.dart';
import 'package:project1_bmi_calculator/constants/constants.dart';
import 'package:project1_bmi_calculator/widgets/container_tile.dart';

class ShowReport extends StatelessWidget {
  String nameOfuser;
  String  resulttextofuser;
  String bmivalueofuser;
  double heightofuser;
  String  unitofuser;
  double weightofuser;
  String personInterpretationofuser;
  ShowReport({required this.resulttextofuser,required this.nameOfuser,required this.bmivalueofuser,required this.heightofuser,required this.unitofuser,required this.weightofuser,required this.personInterpretationofuser});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("$nameOfuser's Report"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Tile(
              colour: Color(0xFF111328),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    resulttextofuser.toUpperCase(),
                    style: TextStyle(
                        fontSize: width*0.08,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent),
                  ),
                  SizedBox(height:(height/12)*0.5,),
                  Text(
                    bmivalueofuser,
                    style: TextStyle(
                        fontSize: width*0.18,
                        fontWeight: FontWeight.bold

                    ),
                  ),
                  SizedBox(height: (height/15)*0.5,),
                  Text(
                    "HEIGHT:$heightofuser cm",
                    style: TextStyle(
                        fontSize: (height/20)*0.5,
                        color: Colors.grey,
                        letterSpacing: 2
                    ),
                  ),
                  Text(
                    "WEIGHT:$weightofuser $unitofuser",
                    style: TextStyle(
                        fontSize: (height/25)*0.5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1
                    ),
                  ),
                  SizedBox(height: (height/12)*0.5,),
                  Container(
                    width: width*0.7  ,
                    child: Text(
                      personInterpretationofuser,
                      style: TextStyle(
                          fontSize: (height/22)*0.5,
                          letterSpacing: 2
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
