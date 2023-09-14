import 'package:flutter/material.dart';
import 'package:goverment_service_app/Controllers/web_view_controller.dart';
import 'package:goverment_service_app/utils/route_utils.dart';
import 'package:goverment_service_app/views/screens/home_page.dart';
import 'package:provider/provider.dart';


void main(){

  runApp(
    ChangeNotifierProvider(create: (context) => WebViewController(),
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
      routes: {
        MyRoutes.home:(context)=>const HomePage(),
      },
    );
  }
}
