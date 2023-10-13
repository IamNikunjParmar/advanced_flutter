import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/route_utils.dart';


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

    Timer.periodic(Duration(seconds: 4),(timer){
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Column(
              children: [
                Container(
                  height: 867,
                  child: Image(
                    image: AssetImage("assets/images/Geeta.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                // Text("श्रीमद भागवत गीता",
                //   style: TextStyle(
                //       color: Color(0xff091C30),
                //       fontSize: 25,
                //       fontWeight: FontWeight.bold
                //   ),
                // ),
              ],
            ),

            const Spacer(),



          ],
        ),
      ),
    );
  }
}
