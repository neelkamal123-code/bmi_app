import 'package:flutter/material.dart';

import 'container_tile.dart';


class BottomButton extends StatelessWidget {
  int flex;
  String text;
  Function function;
  BottomButton({required this.flex,required this.function,required this.text});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap:()=> function(),
        child: Container(
          margin: EdgeInsets.only(right: 50),
          width: width*0.8,
          child: Tile(
            colour: Colors.pink,
            content: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20  ,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


