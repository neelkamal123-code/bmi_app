import 'package:flutter/material.dart';
class Tile extends StatelessWidget {
  Tile({this.content, this.colour,this.giveHeight});
  final content;
  final colour;
  final giveHeight;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: giveHeight,
      width: double.infinity,
      child: content,
      margin: EdgeInsets.all((height/102)*2),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}