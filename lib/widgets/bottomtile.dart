import 'package:flutter/material.dart';
import 'package:project1_bmi_calculator/constants/constants.dart';

import 'container_tile.dart';

class BottomTile extends StatefulWidget {
  String heroTag1;
  String heroTag2;
  String text;
  String unit;
  String parameter;
  int plusCondition;   // b2(110)
  int minusCondition;   // b2(2)
  BottomTile({required this.parameter,required this.text,required this.plusCondition,required this.minusCondition,required this.heroTag1,required this.heroTag2,required this.unit});

  @override
  State<BottomTile> createState() => _BottomTileState();
}

class _BottomTileState extends State<BottomTile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Tile(
        colour: inactiveColor,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.unit.toString(),
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              (widget.parameter=="kg")?weightkg.toInt().toString():((widget.parameter=='age')?age.toString():weightpounds.toInt().toString()),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag:widget.heroTag1,
                  onPressed: () {
                    setState(() {
                      if(widget.parameter=="kg"){
                        if (weightkg < widget.plusCondition) {

                            weightkg++;
                            print(weightkg);

                        }
                      }
                      else if(widget.parameter=="pounds"){
                        if(weightpounds<widget.plusCondition){
                          weightpounds++;
                        }
                      }
                      else{
                        if(age<widget.plusCondition){
                          age++;
                        }
                      }
                      });
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Colors.grey,
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  heroTag: widget.heroTag2,
                  onPressed: () {
                    setState(() {
                      if(widget.parameter=="kg")
                      {
                        if ((weightkg) > widget.minusCondition) {
                          weightkg--;
                        }
                      }
                      else if(widget.parameter=="pounds"){
                        if(weightpounds>widget.minusCondition){
                          weightpounds--;
                        }
                      }
                      else{
                        if(age>widget.minusCondition){
                          age--;
                        }
                      }
                    });
                  },
                  child: Icon(Icons.remove),
                  backgroundColor: Colors.grey,
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}

