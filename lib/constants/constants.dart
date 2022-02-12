import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



final User? user = FirebaseAuth.instance.currentUser;
const activeColor = Color(0xFF1D1E55);
const inactiveColor = Color(0xFF111328);

double weightkg = 55.0;
double weightpounds = 122.0;
int age = 25;
var currentSliderValue = 90;
var maleInactiveColor = activeColor;
var femaleInactiveColor = inactiveColor;


String nameofBMI="Alien";
String feet="0";
String inches="0";
double heightOfperson=0;
double weightOfperson=0;
bool signedin = (user!=null)? true:false;
String bmiResult="";  //Bmi in string
String resultText="";

String interpretation="";

