

import 'package:animation_app/Controllers/fruite_controller.dart';
import 'package:animation_app/Utils/route_utils.dart';
import 'package:animation_app/Views/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Views/screen/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=>FruitController(),
    child: MyApp(),
    ),
  );
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
      initialRoute: MyRoutes.splashscreen,
      routes: {
        MyRoutes.home:(context)=> const HomePage(),
        MyRoutes.splashscreen:(context)=>const SplashScreenPage(),
      },
    );
  }
}
