
import 'package:flutter/material.dart';
import 'dart:async';


class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage>with TickerProviderStateMixin {

  late AnimationController animationController;
  late Animation sizeAnimation ;



  changePage(){
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/');
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
      backgroundColor: const Color(0xff150D56),
      body:AnimatedContainer(
        duration: const Duration(milliseconds: 200),
       curve: Curves.bounceInOut,
       alignment: Alignment.center,
        child:const Image(
          //height: 900,
          image: AssetImage('assets/images/icon.png'),
        )
      ),

    );
  }
}
