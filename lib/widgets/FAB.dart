import 'package:flutter/material.dart';


class FAB extends StatelessWidget {
  Function onpressed;
  IconData icon;
  FAB({required this.onpressed,required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: ()=>onpressed(),
      backgroundColor: Colors.blue,
      child: Icon(
        icon,
        color: Colors.white,
      ),

    );
  }
}
