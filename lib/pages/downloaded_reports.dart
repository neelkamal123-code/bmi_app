import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1_bmi_calculator/constants/constants.dart';
import 'package:project1_bmi_calculator/pages/result_page.dart';
import 'package:project1_bmi_calculator/pages/show_report_page.dart';

class DownloadReports extends StatefulWidget {
  @override
  _DownloadReportsState createState() => _DownloadReportsState();
}

class _DownloadReportsState extends State<DownloadReports> {

  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('bmiresult');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: ref.snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');

          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            // print("printing");
            // print(docs);
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (_, i) {
                final data = docs[i].data();
                // print("data");
                // print(docs[i].id);
                // print(data);
                return ListTile(
                  onTap: () {
                       Navigator.push(
                           context, MaterialPageRoute(builder: (context) => ShowReport(resulttextofuser: data['resulttext'], nameOfuser: data['name'], bmivalueofuser: data['resultvalue'], heightofuser: data['height'], unitofuser:data['unit'], weightofuser: data['weight'],personInterpretationofuser: data['interpretation'])));
                    },
                  title: Text(data['name']),
                  subtitle: Text(data['resulttext']),
                  trailing: GestureDetector(
                    onTap: () {
                      docs[i].reference.delete();
                    },
                    child: Icon(
                      Icons.delete,
                    ),
                  ),
                );
              },
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
