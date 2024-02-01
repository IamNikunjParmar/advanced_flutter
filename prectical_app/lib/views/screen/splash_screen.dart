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
  changePage() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {});
    });

    Timer.periodic(const Duration(seconds: 4), (timer) {
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
            const Spacer(),
            Column(
              children: const [
                SizedBox(
                  height: 867,
                  child: Image(
                    image: NetworkImage(
                        "https://img.freepik.com/free-psd/glowing-like-symbol-realistic-3d-circle_125540-2098.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
