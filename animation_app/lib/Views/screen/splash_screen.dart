import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../../Utils/route_utils.dart';





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
      backgroundColor: Color(0xffD741A9),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset("assets/gif/2.gif"),
          const SizedBox(
            height: 100,
          ),
          Text("Fruits Game",
          style: TextStyle(
            fontSize: 30,
            color: Colors.amber,
          ),
          ),
          const SizedBox(
            height: 50,
          ),
          const CircularProgressIndicator(
            color: Colors.amber,
          ),
          const Spacer(),
        ],
      )
    );
  }
}
