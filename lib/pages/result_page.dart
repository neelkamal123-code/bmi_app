import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1_bmi_calculator/constants/constants.dart';
import 'package:project1_bmi_calculator/controller/firebase_service.dart';
import 'package:project1_bmi_calculator/pages/input_page.dart';
import 'package:project1_bmi_calculator/widgets/FAB.dart';
import 'package:project1_bmi_calculator/widgets/bottombutton.dart';
import 'package:project1_bmi_calculator/widgets/container_tile.dart';

import 'getname_page.dart';


class ResultPage extends StatefulWidget {

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  void _recalculateButton(){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BMICalculator();
    }));
  }
  void Fab1()async{
    FirebaseService service = new FirebaseService();
    try {

      await service.signInwithGoogle();
      setState(() {
        signedin = true;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=>BMICalculator()));

    } catch(e) {
      if (e is FirebaseAuthException) {
        print(e);
      }
    }

  }
  void Fab2(){
    Navigator.push(context, MaterialPageRoute(builder:(context)=>GetName()));
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: width*0.11, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 5,
              child: Tile(
                colour: Color(0xFF111328),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                          fontSize: width*0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent),
                    ),
                    SizedBox(height:(height/12)*0.5,),
                    Text(
                      bmiResult,
                      style: TextStyle(
                        fontSize: width*0.18,
                        fontWeight: FontWeight.bold

                      ),
                    ),
                    SizedBox(height: (height/15)*0.5,),
                    Text(
                      "Normal BMI range:",
                      style: TextStyle(
                        fontSize: (height/20)*0.5,
                        color: Colors.grey,
                        letterSpacing: 2
                      ),
                    ),
                    Text(
                      "18.5 to 25 kg/m2",
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
                        interpretation,
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
            // (signedin)?Expanded(
            //   flex: 1,
            //   child: TextButton(
            //     onPressed: (){
            //         Navigator.push(context, MaterialPageRoute(builder:(context)=>GetName()));
            //     },
            //     child: Column(
            //       children: [
            //         Icon(Icons.save,size: 50,color: Colors.blue,),
            //
            //       ],
            //     ),
            //   ),
            // ):TextButton(
            //   onPressed: ()async{
            //         FirebaseService service = new FirebaseService();
            //         try {
            //
            //         await service.signInwithGoogle();
            //         setState(() {
            //         signedin = true;
            //         });
            //         Navigator.push(context, MaterialPageRoute(builder: (context)=>BMICalculator()));
            //
            //         } catch(e) {
            //           if (e is FirebaseAuthException) {
            //             print(e);
            //           }
            //         }
            //
            //   },
            //     child: Text("Want to save your result?"),
            // ),
            BottomButton(flex: 1, function: _recalculateButton, text: "Re-Calculate BMI"),
          ],
        ),
        floatingActionButton: (signedin)?FAB(onpressed: Fab2,icon: Icons.save,):FAB(onpressed: Fab1, icon: Icons.supervised_user_circle_rounded),
      ),
    );
  }
}
