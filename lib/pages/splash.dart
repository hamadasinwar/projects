import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/db/dbHelper.dart';
import 'package:flutter_app/myProvider.dart';
import 'package:provider/provider.dart';
import '../main.dart';

// ignore: must_be_immutable
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DBHelper.dbHelper.selectAllTasks().then((value){
      Provider.of<MyProvider>(context, listen: false).setTasks(value);
    });
    return Scaffold(
        body: CustomSplash(
          imagePath: 'assets/logo_flutter.png',
          backGroundColor: Colors.white,
          animationEffect: 'zoom-in',
          logoSize: 200,
          home: myPage(),
          customFunction: duringSplash,
          duration: 2500,
          type: CustomSplashType.StaticDuration,
          outputAndHome: op,
        ),
    );
  }

  Map<int, Widget> op = {1: myPage(), 2: myPage()};

  Function duringSplash = (){
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };
}
