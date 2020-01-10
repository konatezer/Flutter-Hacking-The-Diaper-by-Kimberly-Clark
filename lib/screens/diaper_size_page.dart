import 'package:flutter/material.dart';
import 'package:flutter_diaper_challenge/components/gender_selected_card.dart';
import 'package:flutter_diaper_challenge/components/weightCard.dart';
import 'package:flutter_diaper_challenge/services/diaper_size_brain.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

enum Gender {
  male,
  female,
}

class DiaperSizePage extends StatefulWidget {
  static const String id = "diaper_size_screen";
  @override
  _DiaperSizePageState createState() => _DiaperSizePageState();
}

class _DiaperSizePageState extends State<DiaperSizePage> {
  Gender selectedGender = Gender.male;
  String diaperSize = "";
  double badyWeight = 2;
  DiaperSizeBrain diaperSizeBrain;

  double _height;
  // double _width;

  @override
  void initState() {
    super.initState();
    setState(() {
      diaperSizeBrain = DiaperSizeBrain(weight: badyWeight);
      diaperSize = diaperSizeBrain.getDiaperSize();
    });
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    //_width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text('DIAPER SIZE'),
          centerTitle: true,
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          children: <Widget>[
            Material(
              color: Colors.white,
              elevation: 14.0,
              shadowColor: Color(0x802196F3),
              borderRadius: BorderRadius.circular(24.0),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "The prefect fit Diaper",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ),
                          ),
                          Container(
                            height: _height / 6,
                            width: _height / 6,
                            decoration: BoxDecoration(
                              color: Color(0xff9757f7),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Center(
                              child: Text(
                                diaperSize,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: _height / 8),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            GenderSelectedCard(
              heightOfImages: _height,
              title: "Boy",
              image: "assets/images/diaper_boy.png",
              onTap: () {
                setState(() {
                  selectedGender = Gender.male;
                });
              },
              colorCard: selectedGender == Gender.male
                  ? Color(0xffb89ef7)
                  : Colors.white,
            ),
            GenderSelectedCard(
              heightOfImages: _height,
              title: "Girl",
              image: "assets/images/diaper_girl.png",
              onTap: () {
                setState(() {
                  selectedGender = Gender.female;
                  print(selectedGender);
                });
              },
              colorCard: selectedGender == Gender.female
                  ? Color(0xffb89ef7)
                  : Colors.white,
            ),
            WeightCard(
              badyWeight: badyWeight,
              height: _height,
              unitWeight: "LB",
              weightOfUnit: badyWeight.toStringAsFixed(1),
            ),
            WeightCard(
              badyWeight: badyWeight,
              height: _height,
              unitWeight: "KG",
              weightOfUnit: (badyWeight / 2.2).toStringAsFixed(1),
            ),
            Material(
              color: Colors.white,
              elevation: 14.0,
              shadowColor: Color(0x802196F3),
              borderRadius: BorderRadius.circular(24.0),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbColor: Color(0xff9E79F6),
                  overlayColor: Color(0xff9fa3f5),
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Color(0xFF8D8E98),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                ),
                child: Slider(
                  value: badyWeight.toDouble(),
                  min: 2.0,
                  max: 80.0,
                  onChanged: (double value) {
                    setState(() {
                      badyWeight = value.floorToDouble();
                      diaperSizeBrain = DiaperSizeBrain(weight: badyWeight);
                      diaperSize = diaperSizeBrain.getDiaperSize();
                    });
                  },
                ),
              ),
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, _height / 4),
            StaggeredTile.extent(1, _height / 5),
            StaggeredTile.extent(1, _height / 5),
            StaggeredTile.extent(1, _height / 4),
            StaggeredTile.extent(1, _height / 4),
            StaggeredTile.extent(2, _height / 9),
          ],
        ));
  }
}
