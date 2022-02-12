import 'package:flutter/material.dart';
import 'package:project1_bmi_calculator/constants/constants.dart';
import 'package:project1_bmi_calculator/controller/firebase_service.dart';

LogoutGoogleAccount(BuildContext context){
  FirebaseService service = new FirebaseService();
  signedin = false;
  service.signOutFromGoogle(context);
}