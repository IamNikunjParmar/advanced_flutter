

import 'package:flutter/material.dart';
import 'package:pr_5_sky_skapper/Controller/wether_controller.dart';
import 'package:pr_5_sky_skapper/Utils/routes_utils.dart';
import 'package:pr_5_sky_skapper/Views/screens/home_page.dart';
import 'package:pr_5_sky_skapper/Views/screens/splash_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=>WeatherController(),
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
        MyRoutes.home:(context)=>const HomePage(),
        MyRoutes.splashscreen:(context)=>const SplashScreenPage(),
      },
    );
  }
}
