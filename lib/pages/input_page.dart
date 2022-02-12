import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1_bmi_calculator/widgets/FAB.dart';
import 'package:project1_bmi_calculator/widgets/customdrawer.dart';
import 'package:project1_bmi_calculator/widgets/input_page_body.dart';
import '../constants/constants.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';



int systemChoice=1;
class BMICalculator extends StatefulWidget{
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  FSBStatus _fsbStatus=FSBStatus.FSB_CLOSE;
  void Fab1(){
    setState(() {
      _fsbStatus = _fsbStatus == FSBStatus.FSB_OPEN ?
      FSBStatus.FSB_CLOSE : FSBStatus.FSB_OPEN;
    });
  }


  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: FoldableSidebarBuilder(
        drawerBackgroundColor: Colors.black,
        drawer: CustomDrawer(drawerClose: () {
          setState(() {
            _fsbStatus = FSBStatus.FSB_CLOSE;
          });
        },
        ),
        screenContents: InputPageData(),
        status: _fsbStatus,
      ),
      floatingActionButton: FAB(onpressed: Fab1,icon: Icons.menu,),
    );
  }

}
