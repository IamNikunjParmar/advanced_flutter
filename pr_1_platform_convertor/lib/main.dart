

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr_1_platform_convertor/Controllers/date_controller.dart';
import 'package:pr_1_platform_convertor/Controllers/navigation_controller.dart';
import 'package:pr_1_platform_convertor/Controllers/setting_controller.dart';
import 'package:pr_1_platform_convertor/Controllers/theme_controller.dart';
import 'package:pr_1_platform_convertor/utils/route_utils.dart';
import 'package:pr_1_platform_convertor/views/componts/call_page.dart';
import 'package:pr_1_platform_convertor/views/componts/chats_page.dart';
import 'package:pr_1_platform_convertor/views/componts/contact_page.dart';
import 'package:pr_1_platform_convertor/views/componts/ios_call_page.dart';
import 'package:pr_1_platform_convertor/views/componts/ios_chat_page.dart';
import 'package:pr_1_platform_convertor/views/componts/ios_contact_page.dart';
import 'package:pr_1_platform_convertor/views/componts/ios_setting_page.dart';
import 'package:pr_1_platform_convertor/views/componts/setting_page.dart';
import 'package:pr_1_platform_convertor/views/screens/home_page.dart';
import 'package:pr_1_platform_convertor/views/screens/ios_home_page.dart';
import 'package:pr_1_platform_convertor/views/screens/splash_screens.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Controllers/platform_controller.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();



  runApp(
   MultiProvider(
     providers: [
     ChangeNotifierProvider(create: (context) => PlatformController(),
     ),
       ChangeNotifierProvider(create: (context) => NavigationController(),
       ),
     ChangeNotifierProvider(create: (context)=>DateController(),
     ),
       ChangeNotifierProvider(create: (context)=>SettingController(),
       ),

       ChangeNotifierProvider(create: (context)=>ThemeController(),
       ),
   ],
     child: const MyApp(),
   ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.of<PlatformController>(context).isAndroid
        ? MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
     themeMode:  Provider.of<ThemeController>(context).isDark? ThemeMode.dark : ThemeMode.light,
     darkTheme: ThemeData(
       brightness: Brightness.dark,
     ),

     initialRoute:MyRoutes.Splashscreen,
      routes: {
        MyRoutes.Splashscreen: (context) => SplashScreenPage(),
        MyRoutes.home:(context) => Homepage(),
        MyRoutes.ContactPage:(context)=>ContactPage(),
        MyRoutes.ChatsPage:(context)=>ChatsPage(),
        MyRoutes.CallPage:(context)=>CallPage(),
        MyRoutes.SettingPage:(context)=>SettingPage(),

      },
    )
        :CupertinoApp(
      debugShowCheckedModeBanner: false,
      home:  IosHomePage(),
      theme: CupertinoThemeData(
       // brightness: Brightness.dark,
      ),
      routes: {
        MyRoutes.IosContactPage:(context)=>IosContactPage(),
        MyRoutes.IosChatPage:(context)=>IosChatsPage(),
        MyRoutes.IosCallPage:(context)=>IosCallsPage(),
        MyRoutes.IosSettingPage:(context)=>IosSettingPage(),
      },
    );
  }
}



