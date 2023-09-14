import 'package:flutter/material.dart';

import 'dart:async';

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

    Timer.periodic(Duration(seconds: 2),(timer){
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
      backgroundColor: Colors.red,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors:[
                Color(0xff3D246C),
                Color(0xff9F91CC),
                Color(0xff9F91CC),
                Color(0xff9F91CC),
                Color(0xff3D246C),
              ],
            ),
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                height: 80,
              ),

              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Image.asset("assets/images/contact.png",
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),

            const Spacer(),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Color(0xff060047),
              ),
              const SizedBox(
                height: 150,
              ),
              const Text("Contacts",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              ),
              const SizedBox(
                height: 35,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
