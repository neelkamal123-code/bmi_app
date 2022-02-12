
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1_bmi_calculator/pages/input_page.dart';

//keytool -list -v -keystore "C:\Users\neelp\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android

void addData(height,weight,nameOfperson,resultText,resultValue,interpretation,age,context,id)async{

  //save to db

  CollectionReference ref = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('bmiresult');
  var data = {
    'resulttext':resultText,
    'resultvalue':resultValue,
    'interpretation':interpretation,
    'age':age,
    'name':nameOfperson,
    'unit':(systemChoice==1)?'kg':"pounds",
    'height':height,
    'weight':weight,
  };
  if (id!=null){
    ref
        .doc(id) // <-- Doc ID where data should be updated.
        .update(data) // <-- Updated data
        .then((_) => print('Updated'))
        .catchError((error) => print('Update failed: $error'));
  }
  else{
    ref.add(data);
  }

  Navigator.push(context, MaterialPageRoute(builder: (context)=>BMICalculator()));

}