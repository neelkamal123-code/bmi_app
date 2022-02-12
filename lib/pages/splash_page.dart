import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:project1_bmi_calculator/pages/input_page.dart';



const durationOfLogo=1500;

class SplashScreen extends StatelessWidget{

  // Color(0xFF1CA1F1)
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: 'assets/images/splash_logo.png',
        splashIconSize: width,
        nextScreen: BMICalculator(),
        backgroundColor: Colors.black,
        duration: durationOfLogo,
      ),
    );
  }
}


