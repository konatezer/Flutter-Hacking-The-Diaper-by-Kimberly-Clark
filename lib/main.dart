import 'package:flutter/material.dart';
import 'package:flutter_diaper_challenge/screens/diaper_size_page.dart';
import 'package:flutter_diaper_challenge/screens/splash_screen.dart';

void main() => runApp(DiaperSizeCalculator());

class DiaperSizeCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff9E79F6),
      ),
      routes: <String, WidgetBuilder>{
        DiaperSizePage.id: (context) => DiaperSizePage(),
        SplashScreen.id: (context) => SplashScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}
