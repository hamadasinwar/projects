import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        home: CustomSplash(
          imagePath: 'assets/logo_flutter.png',
          backGroundColor: Colors.deepOrange,
          animationEffect: 'zoom-in',
          logoSize: 200,
          home: myPage(),
          customFunction: duringSplash,
          duration: 2500,
          type: CustomSplashType.StaticDuration,
          outputAndHome: op,
        ),
      ),
    );
  }

  Map<int, Widget> op = {1: myPage(), 2: myPage()};

  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };
}
