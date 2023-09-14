import 'package:flutter/cupertino.dart';
import 'package:pr_1_platform_convertor/Controllers/navigation_controller.dart';
import 'package:pr_1_platform_convertor/utils/route_utils.dart';
import 'package:pr_1_platform_convertor/views/componts/ios_call_page.dart';
import 'package:pr_1_platform_convertor/views/componts/ios_chat_page.dart';
import 'package:pr_1_platform_convertor/views/componts/ios_contact_page.dart';
import 'package:pr_1_platform_convertor/views/componts/ios_setting_page.dart';
import 'package:provider/provider.dart';

import '../../Controllers/platform_controller.dart';


class IosHomePage extends StatelessWidget {
   IosHomePage({super.key});


  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context,pro,_) {
        return CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              currentIndex: pro.NavigtionBar,
              onTap: (index) {
                pro.changenavigtion(index: index);
                _pageController.animateToPage(index, duration: Duration(microseconds: 1000), curve: Curves.easeIn);
              },
              items: [
                              BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_add),
                              ),
                              BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble),
                                label: "Chats"
                              ),
                              BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone),
                                label: "Calls"
                              ),
                              BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings),
                                label: "setting"
                              ),

              ],
            ),
            tabBuilder: (BuildContext context,int index){
              return CupertinoTabView(
                builder: (BuildContext context){
                  return  CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      middle: Text("PaltForm Convertor"),
                      trailing: Transform.scale(
                        scale: 0.8,
                        child: Consumer<PlatformController>(
                            builder: (context,pro,_){
                              return CupertinoSwitch(
                                activeColor: CupertinoColors.activeGreen,
                                value: true,
                                onChanged: (value) {

                                  pro.changePlatform();
                                },
                              );
                            }
                        ),
                      ),

                    ),
                    backgroundColor: CupertinoColors.white,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        pro.changenavigtion(index: index);
                      },
                      children:[
                        IosContactPage(),
                        IosChatsPage(),
                        IosCallsPage(),
                        IosSettingPage(),

                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     CupertinoTabBar(
                        //       currentIndex: pro.NavigtionBar,
                        //       onTap: (index) {
                        //         pro.changenavigtion(index: index);
                        //       },
                        //       items: [
                        //         BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_add),
                        //         ),
                        //         BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble),
                        //             label: "Chats"
                        //         ),
                        //         BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone),
                        //             label: "Calls"
                        //         ),
                        //         BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings),
                        //             label: "setting"
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),

                      ],
                    ),
                  );
                },
              );
            }

        );
      }
    );
  }
}
