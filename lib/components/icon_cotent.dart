import 'package:flutter/material.dart';
import 'package:flutter_diaper_challenge/utilities/constant.dart';

class IconContent extends StatelessWidget {
  final IconData iconData;
  final String textData;
  final Color color;
  IconContent({this.iconData, this.textData, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
          color: color,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textData,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
