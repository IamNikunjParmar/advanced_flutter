import 'package:flutter/material.dart';
import 'package:untitled_contact_dairy_app/utils/route_utils.dart';
import 'package:untitled_contact_dairy_app/views/screens/add_contact_page.dart';
import 'package:untitled_contact_dairy_app/views/screens/contact_home_page.dart';

void main(){
  runApp(const MyApp(),
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
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
      ),
      themeMode: ThemeMode.system,
      routes: {
        MyRoutes.home:(context)=> const Homepage(),
        MyRoutes.addcontactpage:(context)=> const AddContactPage(),
      },
    );
  }
}
