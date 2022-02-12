import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1_bmi_calculator/constants/constants.dart';

import 'package:project1_bmi_calculator/controller/firebase_service.dart';
import 'package:project1_bmi_calculator/pages/input_page.dart';
import 'package:project1_bmi_calculator/widgets/fittext.dart';


final User? user = FirebaseAuth.instance.currentUser;
class ProfileWithout extends StatefulWidget {


  @override
  State<ProfileWithout> createState() => _ProfileWithoutState();
}

class _ProfileWithoutState extends State<ProfileWithout> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: (){

      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.face_unlock_rounded,
                size: 30,
              ),
            ),



            ElevatedButton(
              child: FitText("Sign In", 20, Colors.white,FontWeight.bold,2),
              onPressed: () async{
                    FirebaseService service = new FirebaseService();
                    try {

                      await service.signInwithGoogle();
                      setState(() {
                        signedin = true;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BMICalculator()));

                    } catch(e){
                      if(e is FirebaseAuthException){
                        print(e);
                      }
                    }

              },
            ),
            FitText("sign in to save BMI reports", 10,Colors.white, FontWeight.normal, 1)
          ],
        )

      ),
    );
  }
}
