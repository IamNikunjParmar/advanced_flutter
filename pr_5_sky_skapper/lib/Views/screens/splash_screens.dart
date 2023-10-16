
import 'package:flutter/material.dart';

import 'dart:async';

import '../../Utils/routes_utils.dart';





class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {

  FlutterLogoStyle mystyle = FlutterLogoStyle.markOnly;

  changePage(){
    Future.delayed(Duration(milliseconds: 500),(){
      setState(() {
        mystyle = FlutterLogoStyle.horizontal;
      });
    });

    Timer.periodic(Duration(seconds: 5),(timer){
      Navigator.of(context).pushReplacementNamed(MyRoutes.home);

      timer.cancel();
    });
  }
  @override
  void initState() {
    super.initState();
    changePage();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3395FA),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 867,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/weather2.gif"),
              ),
            ),
            ),
        ],
      ),
    );
  }
}
