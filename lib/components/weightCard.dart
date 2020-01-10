import 'package:flutter/material.dart';

class WeightCard extends StatelessWidget {
  final double badyWeight;
  final double height;
  final String unitWeight;
  final String weightOfUnit;

  const WeightCard(
      {@required this.badyWeight,
      @required this.height,
      this.unitWeight,
      this.weightOfUnit});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 8.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        unitWeight,
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Center(
                      child: Text(
                        weightOfUnit,
                        style: TextStyle(
                            color: Color(0xff8b46f2),
                            fontWeight: FontWeight.bold,
                            fontSize: height / 12),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
