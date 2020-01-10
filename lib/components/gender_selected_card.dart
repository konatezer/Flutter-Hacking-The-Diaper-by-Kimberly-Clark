import 'package:flutter/material.dart';
import 'package:flutter_diaper_challenge/utilities/constant.dart';

class GenderSelectedCard extends StatelessWidget {
  final double heightOfImages;
  final String title;
  final String image;
  final Color colorCard;
  final Function onTap;

  GenderSelectedCard(
      {this.heightOfImages,
      this.title,
      this.image,
      @required this.colorCard,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: colorCard,
        elevation: 14.0,
        shadowColor: Color(0x802196F3),
        borderRadius: BorderRadius.circular(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: kLabelTextStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: heightOfImages / 9,
              width: heightOfImages / 9,
              child: Image(
                image: AssetImage(image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
