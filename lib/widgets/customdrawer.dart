import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1_bmi_calculator/constants/constants.dart';
import 'package:project1_bmi_calculator/controller/firebase_service.dart';
import 'package:project1_bmi_calculator/functions/logout.dart';
import 'package:project1_bmi_calculator/pages/downloaded_reports.dart';
import 'package:project1_bmi_calculator/pages/input_page.dart';


class CustomDrawer extends StatefulWidget {
  final Function drawerClose;

  CustomDrawer({required this.drawerClose});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return (!signedin)?Container(
      color: Colors.black,
      width: width * 0.60,
      height: height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/splash_logo.png",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Not signed in!")
                ],
              )),
          ListTile(
            onTap: () async {
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
            leading: Icon(Icons.supervised_user_circle_rounded),
            title: Text(
              "Sign In",
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),


        ],
      ),
    ):
    Container(
      color: Colors.black,
      width: width * 0.60,
      height: height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    user!.photoURL!,
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Your Account")
                ],
              )),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DownloadReports()));
            },
            leading: Icon(Icons.file_download_done),
            title: Text(
              "Your Reports",
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              LogoutGoogleAccount(context);
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
