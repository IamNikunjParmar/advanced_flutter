import 'package:budget_tracker_app/View/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'View/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/splash_screen',
      getPages: [
        GetPage(
            name: '/',
            page:()=> const HomePage()
        ),
        GetPage(
            name: '/splash_screen',
            page:()=> const SplashScreenPage()
        ),

      ],
    );
  }
}
