

import 'package:flutter/material.dart';
import 'package:practical_exam_app/Controllers/Quote_controller.dart';
import 'package:practical_exam_app/Views/screens/details_page.dart';
import 'package:practical_exam_app/Views/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'Utils/routes_utils.dart';
import 'Views/screens/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=> QuoteController(),
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
        MyRoutes.splashscreen:(context)=> const SplashScreenPage(),
        MyRoutes.detailsPage:(context)=>const DetailPage(),
      },
    );
  }
}
