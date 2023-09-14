import 'package:flutter/material.dart';
import 'package:pr_1_platform_convertor/Controllers/navigation_controller.dart';
import 'package:pr_1_platform_convertor/views/componts/call_page.dart';
import 'package:pr_1_platform_convertor/views/componts/chats_page.dart';
import 'package:pr_1_platform_convertor/views/componts/contact_page.dart';
import 'package:pr_1_platform_convertor/views/componts/setting_page.dart';
import 'package:provider/provider.dart';

import '../../Controllers/platform_controller.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9F91CC),
       foregroundColor: Colors.white,
        toolbarHeight: 80,
        flexibleSpace: Container(
          height: 80,
          padding: EdgeInsets.all(18),
          margin: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
             color: Color(0xff3D246C),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40))
          ),
          alignment: Alignment.topLeft,
          child: Transform.translate(
            offset: Offset(0,3),
            child: Text("PlatForm Convertor",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            ),
          ),
        ),
        actions: [
          Consumer<PlatformController>(
              builder: (context,pro,_) {
                return Transform.translate(
                  offset: Offset(0,5),
                  child: Transform.scale(
                    scale: 0.9,
                    child: Switch(
                        value: false,
                        onChanged: (value) {
                          pro.changePlatform();
                        }
                    ),
                  ),
                );
              }
          )
        ],
      ),
      body: Consumer<NavigationController>(
        builder: (context,pro,_) {
          return PageView(
            controller: _pageController,
            onPageChanged: (index) {
             pro.changenavigtion(index: index);

            },
            children: [
              ContactPage(),
              ChatsPage(),
              CallPage(),
              SettingPage(),
            ],
          );
        }
      ),
      bottomNavigationBar:  Consumer<NavigationController>(
        builder: (context,pro,_) {
          return BottomNavigationBar(
             currentIndex: pro.NavigtionBar,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                pro.changenavigtion(index: index);
                _pageController.animateToPage(index, duration: Duration(microseconds: 1000), curve: Curves.easeIn);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_add),
                  label: "Contacts",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_sharp),
                  label: "Chats",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.call),
                  label: "Call",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Setting",
                ),
              ]);
        }
      ),
    );
  }
}
