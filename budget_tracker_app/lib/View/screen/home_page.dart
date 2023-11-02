import 'package:budget_tracker_app/Controllers/db_controller.dart';
import 'package:budget_tracker_app/Controllers/navigation_controller.dart';
import 'package:budget_tracker_app/Modals/student_modal.dart';
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
    DbController dbController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xff150D56),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer:  Drawer(
        child: ListView(
          padding:  const EdgeInsets.all(0),
          children: [
             const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff150D56),
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Color(0xff150D56)),
                accountName: Text(
                  "Nikunj Parmar",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("nikunjparmar5066@gmail.com"),
                currentAccountPictureSize: Size.square(40),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.indigo,
                  child: Text(
                    "N",
                    style: TextStyle(
                        fontSize: 25.0, color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(' Setting '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        )
        
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
            curve: Curves.easeInOut,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff150D56),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {

          Student student = Student("vishal", "Flutter", 20);

        },
      ),
      body: PageView(
        controller: naviController.pageController,
        onPageChanged: (index) {
          naviController.changeIndex(index: index);
        },
        children: naviController.pages
      ),
    );
  }
}
