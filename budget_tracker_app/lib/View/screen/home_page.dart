import 'package:budget_tracker_app/Controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    NavigationController naviController = Get.put(NavigationController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xff150D56),
      ),
      bottomNavigationBar:  Obx(
         () {
          return GNav(
            activeColor: const Color(0xff150D56),
            tabBorderRadius: 40,
            tabActiveBorder: Border.all(
                color: const Color(0xff150D56), width: 2
            ),
            tabBorder: Border.all(
                color: Colors.grey, width: 1
            ),
            tabShadow: [
              BoxShadow(
                  color: Colors.grey.shade400.withOpacity(0.5),
                  blurRadius: 8,
              ),
            ],
            curve: Curves.easeOutExpo,
            duration: const Duration(
                milliseconds: 800
            ),
            gap: 6,
            color: Colors.grey.shade800,
            iconSize: 24,
           tabBackgroundColor:const Color(0xff150D56).withOpacity(0.1),
            padding: const EdgeInsets.all(15),
            tabMargin: const EdgeInsets.all(10),
            onTabChange: (index) {
              naviController.changeIndex(index: index);
            },
            selectedIndex: naviController.selectedIndex.value,
            tabs: const [
              GButton(
                  icon: Icons.home,
                text: "Home",
                iconColor: Color(0xff150D56),
              ),
              GButton(
                icon: Icons.category_outlined,
                text: "Category",
                iconColor: Color(0xff150D56),
              ),
              GButton(
                icon: Icons.bar_chart_sharp,
                text: "Charts",
                iconColor: Color(0xff150D56),
              ),
              GButton(
                icon: Icons.person,
                text: "Profile",
                iconColor: Color(0xff150D56),
              ),
            ],

          );
        }
      ),
      body: PageView(
        controller: naviController.pageController,
        onPageChanged: (index) {
          naviController.changeIndex(index: index);
        },
        children: [
          Icon(Icons.home),
          Icon(Icons.category_outlined),
          Icon(Icons.bar_chart_sharp),
          Icon(Icons.person),


        ],
      ),
    );
  }
}
