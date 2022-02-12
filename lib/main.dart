import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:project1_bmi_calculator/pages/splash_page.dart';

import 'package:flutter/services.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI CALCULATOR",
      home: SplashScreen(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Colors.black,
      ),
    ));
  });
}

