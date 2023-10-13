

import 'package:flutter/material.dart';
import 'package:pr_4_departure/Controllers/theme_controller.dart';
import 'package:pr_4_departure/Utils/route_utils.dart';
import 'package:pr_4_departure/Views/screens/detail_page.dart';
import 'package:pr_4_departure/Views/screens/setting_page.dart';
import 'package:pr_4_departure/Views/screens/slock_details_page.dart';
import 'package:pr_4_departure/Views/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'Views/screens/home_page.dart';

void main() {
  runApp(
   MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (context)=>ThemeController()),

   ],
     child: const MyApp(),
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
      initialRoute: MyRoutes.SplashScreen,
      routes: {
        MyRoutes.home:(context)=> const HomePage(),
        MyRoutes.SplashScreen:(context)=> const SplashScreenPage(),
        MyRoutes.SettingPage:(context)=>  SettingPage(),
        MyRoutes.Detailpage:(context)=> const DetailPage(),
        MyRoutes.SlockDetailpage:(context)=>const SlockDetailsPage(),
      },
      themeMode:  Provider.of<ThemeController>(context).isDark? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(
          brightness: Brightness.dark
      ),
    );
  }
}
