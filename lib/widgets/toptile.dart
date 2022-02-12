import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopTile extends StatefulWidget {
  String text;
  IconData icon;
  TopTile({required this.text,required this.icon});

  @override
  _TopTileState createState() => _TopTileState();
}

class _TopTileState extends State<TopTile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          widget.icon,
          size: (width/11)*2,
        ),
        SizedBox(
          height: height/34,
        ),
        Text(
          widget.text,
          style: TextStyle(
            fontSize: (width/10)*0.5,
            letterSpacing: 3,
          ),
        )
      ],
    );
  }
}
