import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/Utils/my_routes.dart';
import 'package:my_chat_app/Views/Screens/home_page.dart';
import 'package:my_chat_app/Views/Screens/login_page.dart';
import 'package:my_chat_app/Views/Screens/sign_up_page.dart';

import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );

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
      initialRoute: FirebaseAuth.instance.currentUser != null ? MyRoutes.home : MyRoutes.login,
      routes: {
        MyRoutes.login:(context) => const LoginPage(),
        MyRoutes.home:(context) =>   HomePage(),
        MyRoutes.signUpPage:(context)=>  SignUpPage(),
      },
    );
  }
}
