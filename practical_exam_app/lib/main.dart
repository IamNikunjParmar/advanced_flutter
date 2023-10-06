import 'package:flutter/material.dart';
import 'package:practical_exam_app/Views/screens/splash_screen.dart';

import 'Utils/routes_utils.dart';
import 'Views/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        MyRoutes.home:(context)=> const HomePage(),
        MyRoutes.splashscreen:(context)=> const SplashScreenPage(),
      },
    );
  }
}
