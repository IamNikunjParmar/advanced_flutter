import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:prectical_app/firebase_options.dart';
import 'package:prectical_app/utils/route_utils.dart';
import 'package:prectical_app/views/screen/home_page.dart';
import 'package:prectical_app/views/screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MyApp(),
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
      initialRoute: MyRoutes.splashScreen,
      routes: {
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.splashScreen: (context) => const SplashScreenPage(),
      },
    );
  }
}
